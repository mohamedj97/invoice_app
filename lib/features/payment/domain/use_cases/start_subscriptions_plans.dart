import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';

class StartSubscriptionPlansUseCase {
  final PaymentRepository paymentRepository;

  StartSubscriptionPlansUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, IntResponse>> call({required int subscriptionPlanId,required int userId}) async {
    return await paymentRepository.startSubscription(subscriptionPlanId: subscriptionPlanId,userId:userId);
  }
}
