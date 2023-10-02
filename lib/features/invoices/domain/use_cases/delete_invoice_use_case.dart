import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';

class DeleteInvoiceUseCase {
  final InvoicesRepository invoicesRepository;
  DeleteInvoiceUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, BoolResponse>> call(int id) async {
    return await invoicesRepository.deleteInvoice(id);
  }
}