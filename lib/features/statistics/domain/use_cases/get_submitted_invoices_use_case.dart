import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/statistics/domain/repositories/submited_invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/responses/get_submitted_invoices_response_model.dart';

class GetSubmittedInvoiceUseCase {
  final SubmittedInvoicesRepository submittedInvoicesRepository;
  GetSubmittedInvoiceUseCase({
    required this.submittedInvoicesRepository,
  });

  Future<Either<Failure, GetSubmittedInvoiceResponse>> call() async {
    return await submittedInvoicesRepository.getSubmittedInvoices();
  }
}
