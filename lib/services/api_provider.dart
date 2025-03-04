import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:beauty_app_mobile/core/enums/enums.dart';
import 'package:dio/dio.dart';

import '../core/constants/constants.dart';

class ResponseData {
  ResponseData({
    required this.data,
    required this.isSuccessful,
  });

  dynamic data;
  bool isSuccessful;
}

class ApiProvider {
  ApiProvider(this._client) {
    baseUrl = Constants.baseUrl;
  }

  final Dio _client;

  String? baseUrl;

  Future<ResponseData> launchRequest(
      {String? baseUrl,
      required String endPoint,
      required String method,
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams,
      isFromData = false}) async {
    var url = (baseUrl ?? this.baseUrl!) + endPoint;

    var headersWithContentType = {
      "content-type": "application/json",
    };

    if (headers != null) {
      headersWithContentType.addAll(headers);
    }

    try {
      print(url);
      switch (method.toUpperCase()) {
        case "GET":
          var response = await _client.get(url,
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "POST":
          var response = await _client.post(
            url,
            data: isFromData ? FormData.fromMap(body!) : jsonEncode(body),
            queryParameters: queryParams,
            options: Options(headers: headersWithContentType),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "PUT":
          var response = await _client.put(url,
              data: jsonEncode(body),
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "DELETE":
          var response = await _client.delete(url,
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }
        default:
          return ResponseData(data: {}, isSuccessful: false);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw HttpErrorType.connectionTimeout;
      } else if (e.error is SocketException) {
        throw HttpErrorType.connectionTimeout;
      } else {
        throw e.response?.data;
      }
    }
  }
}
