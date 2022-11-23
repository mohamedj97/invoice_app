import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config.dart';
import '../../features/auth/api/auth_client.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class APIRepository {
  late AuthClient authClient;

  // APIRepository();
  APIRepository.internal() {
    final dio = Dio();
    final authDio = Dio();
    if (kEnvironment == Environment.production) {
      dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        baseUrl: apiBaseUrl,
        sendTimeout: const Duration(seconds: 120).inMilliseconds,
      );

      authDio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        baseUrl: apiBaseUrl,
      );
    }
    if (kEnvironment == Environment.staging) {
      dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        receiveTimeout: const Duration(seconds: 60).inMilliseconds,
        baseUrl: apiBaseUrl,
        sendTimeout: const Duration(seconds: 60).inMilliseconds,
      );

      authDio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        baseUrl: apiBaseUrl,
      );
    }
    dio.options.validateStatus = (_) => true;
    dio.options.receiveDataWhenStatusError = true;
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
      authDio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          // request: false,
          // requestBody: true,
          // requestHeader: false,
          // responseHeader: false,
          // responseBody: true,
          // error: true,
        ),
      );
    }

    dio.interceptors.addAll([AuthInterceptor(dio), ErrorInterceptor()]);

    authDio.interceptors.add(ErrorInterceptor());
    authClient = AuthClient(authDio, baseUrl: apiBaseUrl);
  }
  Future ensureInitialized() async => true;
}
