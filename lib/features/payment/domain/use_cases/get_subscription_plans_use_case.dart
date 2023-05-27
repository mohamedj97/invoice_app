import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/subscription_plans_model.dart';

class GetSubscriptionPlansUseCase {
  final PaymentRepository paymentRepository;
  GetSubscriptionPlansUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, SubscriptionPlanModelListGenericResponseResult>> call() async {
    return await paymentRepository.getSubscriptionPlans();
  }
}
