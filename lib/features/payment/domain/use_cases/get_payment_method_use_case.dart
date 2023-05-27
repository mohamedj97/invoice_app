import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/payment_methods_results.dart';

class GetPaymentMethodsUseCase {
  final PaymentRepository paymentRepository;
  GetPaymentMethodsUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> call() async {
    return await paymentRepository.getPaymentMethods();
  }
}
