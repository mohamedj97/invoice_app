import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/payment_methods_results.dart';

class ExecutePaymentUseCase {
  final PaymentRepository paymentRepository;

  ExecutePaymentUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, PgPaymentMethodListGenericResponseResult>> call({
    required int paymentMethodId,
    required int invoiceId,
    required String redirectUrl,
  }) async {
    return await paymentRepository.executePayment(
        paymentMethodId: paymentMethodId, invoiceId: invoiceId, redirectUrl: redirectUrl);
  }
}
