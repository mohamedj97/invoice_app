import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:invoice_app/features/customers/api/customers_client.dart';
import 'package:invoice_app/features/invoices/api/invoices_client.dart';
import 'package:invoice_app/features/payment/api/payment_client.dart';
import 'package:invoice_app/features/products/api/products_client.dart';
import 'package:invoice_app/features/profile/api/profile_client.dart';
import 'package:invoice_app/features/roles/api/roles_client.dart';
import 'package:invoice_app/features/users/api/users_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config.dart';
import '../../features/auth/api/auth_client.dart';
import '../../features/branches/api/branches_client.dart';
import '../../features/company_registration/api/company_registration_client.dart';
import '../../features/statistics/api/statistics_client.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class APIRepository {
  late AuthClient authClient;
  late BranchesClient branchesClient;
  late RolesClient rolesClient;
  late PaymentClient paymentClient;
  late InvoicesClient invoicesClient;
  late CustomersClient customersClient;
  late ProductsClient productsClient;
  late ProfileClient profileClient;
  late UsersClient usersClient;
  late StatisticsClient statisticsClient;
  late CompanyRegistrationClient companyRegistrationClient;

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
    invoicesClient = InvoicesClient(authDio, baseUrl: apiBaseUrl);
    branchesClient = BranchesClient(authDio, baseUrl: apiBaseUrl);
    customersClient = CustomersClient(authDio, baseUrl: apiBaseUrl);
    productsClient = ProductsClient(authDio, baseUrl: apiBaseUrl);
    profileClient = ProfileClient(authDio, baseUrl: apiBaseUrl);
    statisticsClient = StatisticsClient(authDio, baseUrl: apiBaseUrl);
    rolesClient = RolesClient(authDio, baseUrl: apiBaseUrl);
    paymentClient = PaymentClient(authDio, baseUrl: apiBaseUrl);
    usersClient = UsersClient(authDio, baseUrl: apiBaseUrl);
    companyRegistrationClient = CompanyRegistrationClient(authDio, baseUrl: apiBaseUrl);
  }
  Future ensureInitialized() async => true;
}
