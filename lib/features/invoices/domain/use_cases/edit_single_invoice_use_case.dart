import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/invoice_request_model.dart';

class EditSingleInvoiceUseCase {
  final InvoicesRepository invoicesRepository;
  EditSingleInvoiceUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, BoolResponse>> call(int id, InvoiceRequestModel invoiceRequestModel) async {
    return await invoicesRepository.editSingleInvoices(id,invoiceRequestModel);
  }
}
