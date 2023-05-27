import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/payment_methods_results.dart';
import '../../domain/entities/subscription_plans_model.dart';

abstract class PaymentRemoteDataSource {
  Future<SubscriptionPlanModelListGenericResponseResult> getSubscriptionPlans();

  Future<IntResponse> startSubscription({required int subscriptionPlanId});

  Future<PgPaymentMethodListGenericResponseResult> getPaymentMethods();

  Future<PgPaymentMethodListGenericResponseResult> executePayment({
    required int paymentMethodId,
    required int invoiceId,
    required String redirectUrl,
  });
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  final APIRepository apiRepo;

  PaymentRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<PgPaymentMethodListGenericResponseResult> executePayment({required int paymentMethodId, required int invoiceId, required String redirectUrl}) async{
    final response = await apiRepo.paymentClient.executePayment(paymentMethodId,invoiceId,redirectUrl);
    return response;
  }

  @override
  Future<PgPaymentMethodListGenericResponseResult> getPaymentMethods() async{
    final response = await apiRepo.paymentClient.getPaymentMethods();
    return response;
  }

  @override
  Future<SubscriptionPlanModelListGenericResponseResult> getSubscriptionPlans() async{
    final response = await apiRepo.paymentClient.getSubscriptionPlans();
    return response;
  }

  @override
  Future<IntResponse> startSubscription({required int subscriptionPlanId}) async{
    final response = await apiRepo.paymentClient.startSubscription(subscriptionPlanId);
    return response;
  }


}
