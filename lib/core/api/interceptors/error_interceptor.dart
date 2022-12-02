import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../base_api_response.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    if (data == null) {
      if (err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.sendTimeout ||
          err.type == DioErrorType.receiveTimeout ||
          err.type == DioErrorType.other) {
        final networkOperationResult = BaseAPIResponse(
            statuscode: 0,
            message:
                "network_error".tr());
        final networkErrorResponse = Response(
          requestOptions: err.requestOptions,
          data: networkOperationResult.toJson(),
          statusCode: 200,
        );
        return handler.resolve(networkErrorResponse);
      }
      return handler.next(err);
    }
    if (err.response != null && err.response!.data is Map<String, dynamic>) {
      final operationResult = BaseAPIResponse.fromJson(err.response!.data);
      // print("Operation Result Error Message: " + operationResult.errorMessage!);
      var response = Response(
        requestOptions: err.requestOptions,
        data: operationResult.toJson(),
        statusCode: 200,
      );
      return handler.resolve(response);
    }

    return handler.next(err);
  }
}
