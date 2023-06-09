import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_company_subscribtions_resutlt.dart';

class GetCompanySubscriptionUseCase {
  final PaymentRepository paymentRepository;
  GetCompanySubscriptionUseCase({
    required this.paymentRepository,
  });

  Future<Either<Failure, CompanySubscriptionResult>> call() async {
    return await paymentRepository.getCompanySubscription();
  }
}
