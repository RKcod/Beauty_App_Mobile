import 'package:beauty_app_mobile/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends ChangeNotifier {
  final Ref ref;
  AuthController(this.ref);

  Future<String> signup() async {
    var result = await ref
        .read(apiProvider)
        .launchRequest(
          endPoint: "auth/register",
          method: "POST",
          body: {
            "fullName": "Emmanuel Mbang",
            "email": "emmanuelmbang@gmail.com",
            "password": "Emma1234",
            "phone": "+23700000000",
            "role": "CLIENT",
            "city": "Douala",
            "country": "Cameroun",
            "latitude": 4.0511,
            "longitude": 9.7679,
          },
        );

    return result.data["response"].toString();
  }

  Future<String> login() async {
    var result = await ref
        .read(apiProvider)
        .launchRequest(
          endPoint: "auth/login",
          method: "POST",
          body: {"email": "emmanuelmbang@gmail.com", "password": "Emma1234"},
        );

    return result.data["response"].toString();
  }

  Future<String> resetPassword() async {
    var result = await ref
        .read(apiProvider)
        .launchRequest(
          endPoint: "auth/reset-password",
          method: "POST",
          body: {
            "token":
                "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyb25hbGRva2FuYTEyQGdtYWlsLmNvbSIsInJvbGUiOiJDTElFTlQiLCJpZCI6MSwiaWF0IjoxNzQ3MzAyNjQwLCJleHAiOjE3NDczMzg2NDB9.Yoj3CAa0Xs2MGf7F-DJZEckKHn7aNL_6CTfVqyHPw5w",
            "oldPassword": "VJmannequin12",
            "newPassword": "123456789",
          },
        );

    return result.data["response"].toString();
  }
}
