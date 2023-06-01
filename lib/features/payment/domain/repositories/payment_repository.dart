import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../entities/excute_payment_result.dart';
import '../entities/payment_methods_results.dart';
import '../entities/subscription_plans_model.dart';

abstract class PaymentRepository {

  Future<Either<Failure, SubscriptionPlanModelListGenericResponseResult>> getSubscriptionPlans();

  Future<Either<Failure, IntResponse>> startSubscription({required int subscriptionPlanId});

  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> getPaymentMethods();

  Future<Either<Failure, PaymentGatewayResponseDataGenericResponseResult>> executePayment({
    required int paymentMethodId,
    required int invoiceId,
    required String redirectUrl,
  });
}
