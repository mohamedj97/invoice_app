import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/core/error/failure.dart';
import 'package:invoice_app/features/payment/domain/entities/get_company_subscribtions_resutlt.dart';
import 'package:invoice_app/features/payment/domain/entities/payment_methods_results.dart';
import 'package:invoice_app/features/payment/domain/entities/subscription_plans_model.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../../domain/entities/excute_payment_result.dart';
import '../data_sources/payment_remote_date_source.dart';

class PaymentRepositoryImpl extends PaymentRepository with ConnectivityMixin {
  final PaymentRemoteDataSource paymentRemoteDataSource;

  PaymentRepositoryImpl(this.paymentRemoteDataSource);

  @override
  Future<Either<Failure, PaymentGatewayResponseDataGenericResponseResult>> executePayment(
      {required int paymentMethodId, required int invoiceId, required int userId}) async {
    try {
      final response = await paymentRemoteDataSource.executePayment(
          paymentMethodId: paymentMethodId, invoiceId: invoiceId, userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> getPaymentMethods() async {
    try {
      final response = await paymentRemoteDataSource.getPaymentMethods();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SubscriptionPlanModelListGenericResponseResult>> getSubscriptionPlans() async {
    try {
      final response = await paymentRemoteDataSource.getSubscriptionPlans();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, IntResponse>> startSubscription({required int subscriptionPlanId, required int userId}) async {
    try {
      final response =
          await paymentRemoteDataSource.startSubscription(subscriptionPlanId: subscriptionPlanId, userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CompanySubscriptionResult>> getCompanySubscription() async {
    try {
      final response = await paymentRemoteDataSource.getCompanySubscription();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
