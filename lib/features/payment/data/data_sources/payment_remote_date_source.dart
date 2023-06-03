import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/excute_payment_result.dart';
import '../../domain/entities/payment_methods_results.dart';
import '../../domain/entities/subscription_plans_model.dart';

abstract class PaymentRemoteDataSource {
  Future<SubscriptionPlanModelListGenericResponseResult> getSubscriptionPlans();

  Future<IntResponse> startSubscription({required int subscriptionPlanId,required int userId});

  Future<PgPaymentMethodListGenericResponseResult> getPaymentMethods();

  Future<PaymentGatewayResponseDataGenericResponseResult> executePayment({
    required int paymentMethodId,
    required int invoiceId,
    required int userId,
  });
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  final APIRepository apiRepo;

  PaymentRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<PaymentGatewayResponseDataGenericResponseResult> executePayment({required int paymentMethodId, required int invoiceId, required int userId}) async{
    final response = await apiRepo.paymentClient.executePayment(paymentMethodId,invoiceId,userId);
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
  Future<IntResponse> startSubscription({required int subscriptionPlanId,required int userId}) async{
    final response = await apiRepo.paymentClient.startSubscription(subscriptionPlanId,userId);
    return response;
  }


}
