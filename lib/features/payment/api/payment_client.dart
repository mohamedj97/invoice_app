import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/strings/end_points.dart';
import '../domain/entities/excute_payment_result.dart';
import '../domain/entities/payment_methods_results.dart';
import '../domain/entities/subscription_plans_model.dart';

part 'payment_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class PaymentClient {
  factory PaymentClient(Dio dio, {String baseUrl}) = _PaymentClient;

  @GET(EndPoints.getSubscriptionPlans)
  Future<SubscriptionPlanModelListGenericResponseResult> getSubscriptionPlans();

  @POST(EndPoints.startSubscription)
  Future<IntResponse> startSubscription(@Query("SubscriptionPlanId") int subscriptionPlanId);

  @GET(EndPoints.getPaymentMethods)
  Future<PgPaymentMethodListGenericResponseResult> getPaymentMethods();

  @POST(EndPoints.executePayment)
  Future<PaymentGatewayResponseDataGenericResponseResult> executePayment(
      @Query("paymentMethodId") int paymentMethodId,
      @Query("invoiceId") int invoiceId,
      @Query("redirectUrl") String redirectUrl);
}
