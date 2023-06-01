import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/excute_payment_result.dart';

class ExecutePaymentUseCase {
  final PaymentRepository paymentRepository;

  ExecutePaymentUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, PaymentGatewayResponseDataGenericResponseResult>> call({
    required int paymentMethodId,
    required int invoiceId,
    required String redirectUrl,
  }) async {
    return await paymentRepository.executePayment(
        paymentMethodId: paymentMethodId, invoiceId: invoiceId, redirectUrl: redirectUrl);
  }
}
