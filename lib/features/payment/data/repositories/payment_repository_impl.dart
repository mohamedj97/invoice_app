import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/core/error/failure.dart';
import 'package:invoice_app/features/payment/domain/entities/payment_methods_results.dart';
import 'package:invoice_app/features/payment/domain/entities/subscription_plans_model.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/payment_remote_date_source.dart';

class PaymentRepositoryImpl extends PaymentRepository with ConnectivityMixin {
  final PaymentRemoteDataSource paymentRemoteDataSource;

  PaymentRepositoryImpl(this.paymentRemoteDataSource);

  @override
  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> executePayment({required int paymentMethodId, required int invoiceId, required String redirectUrl}) async{
    try {
      final response = await paymentRemoteDataSource.executePayment(paymentMethodId: paymentMethodId, invoiceId: invoiceId, redirectUrl: redirectUrl);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> getPaymentMethods()async {
    try {
      final response = await paymentRemoteDataSource.getPaymentMethods();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SubscriptionPlanModelListGenericResponseResult>> getSubscriptionPlans() async{
    try {
      final response = await paymentRemoteDataSource.getSubscriptionPlans();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, IntResponse>> startSubscription({required int subscriptionPlanId}) async{
    try {
      final response = await paymentRemoteDataSource.startSubscription(subscriptionPlanId: subscriptionPlanId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }


}
