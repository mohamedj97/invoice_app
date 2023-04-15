import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/invoice_request_model.dart';
import '../../data/models/responses/get_single_invoice_response_model.dart';

class AddInvoiceUseCase {
  final InvoicesRepository invoicesRepository;
  AddInvoiceUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetSingleInvoiceResponse>> call(InvoiceRequestModel invoiceRequestModel) async {
    return await invoicesRepository.addInvoice(invoiceRequestModel);
  }
}
