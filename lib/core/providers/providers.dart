import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api_provider.dart';

final dioProvider = riverpod.Provider(
    (_) => Dio(BaseOptions(connectTimeout: const Duration(seconds: 10))));
final apiProvider =
    riverpod.Provider((ref) => ApiProvider(ref.watch(dioProvider)));
final sharedPreferencesProvider = riverpod.Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final localeProvider = riverpod.StateProvider<Locale?>(
  (ref) => null,
);
