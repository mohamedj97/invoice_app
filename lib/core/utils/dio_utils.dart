// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../../main_common.dart';
// import '../error/failures.dart';
//
// class DioUtils {
//   static Failure getDioExceptionMessage(dynamic error, StackTrace stackTrace,
//       {Failure? Function(int, Response<dynamic>?)? handleStatusCode}) {
//     if (error is Exception) {
//       try {
//         if (error is DioError) {
//           switch (error.type) {
//             case DioErrorType.cancel:
//               return CancelFailure();
//             case DioErrorType.connectTimeout:
//               return InternetFailure();
//
//             case DioErrorType.other:
//               return InternetFailure();
//
//             case DioErrorType.receiveTimeout:
//               return InternetFailure();
//             case DioErrorType.response:
//               if (handleStatusCode?.call(
//                       error.response!.statusCode!, error.response) !=
//                   null) {
//                 return handleStatusCode!
//                     .call(error.response!.statusCode!, error.response)!;
//               }
//               switch (error.response?.statusCode) {
//                 case 400:
//                 case 429:
//                 case 440:
//                 case 401:
//                 case 439:
//                   final response = error.response?.data as Map<String, dynamic>;
//                   if (response.containsKey('detail')) {
//                     return ServerFailure(
//                         message: response['detail'] as String?);
//                   }
//                   if (response.containsKey('message')) {
//                     return ServerFailure(
//                         message: response['message'] as String?);
//                   }
//                   return ValidationFailure(
//                       errors: response.map((key, value) =>
//                           MapEntry<String, List<String>>(
//                               key,
//                               (value as List<dynamic>)
//                                   .map((e) => e.toString())
//                                   .toList())));
//
//                 case 500:
//                   logger.e(
//                       error.message,
//                       error,
//                       stackTrace,
//                       {
//                         'request': error.requestOptions.toString(),
//                         'response': error.response.toString()
//                       }.toString());
//                   return ServerFailure();
//                 case 503:
//                   logger.e(
//                       error.message,
//                       error,
//                       stackTrace,
//                       {
//                         'request': error.requestOptions.toString(),
//                         'response': error.response.toString()
//                       }.toString());
//
//                   return ServerFailure();
//
//                 default:
//                   final response = error.response?.data as Map<String, dynamic>;
//
//                   return handleStatusCode?.call(
//                           error.response!.statusCode!, error.response) ??
//                       (response.containsKey('detail')
//                           ? ServerFailure(
//                               message: response['detail'] as String?)
//                           : ServerFailure());
//               }
//             case DioErrorType.sendTimeout:
//               return InternetFailure();
//           }
//         } else if (error is SocketException) {
//           return InternetFailure();
//         }
//         return InternetFailure();
//       } on FormatException {
//         logger.e(error, error, stackTrace);
//         return ServerFailure();
//       } catch (e, stackTrace) {
//         logger.e(e, error, stackTrace);
//
//         return ServerFailure();
//       }
//     } else {
//       logger.e(error, error, stackTrace);
//
//       if (error.toString().contains('is not a subtype of')) {
//         return ServerFailure();
//       } else {
//         return ServerFailure();
//       }
//     }
//   }
// }
