import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/invoice_request_model.dart';

class AddInvoiceUseCase {
  final InvoicesRepository invoicesRepository;
  AddInvoiceUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, StringResponse>> call(InvoiceRequestModel invoiceRequestModel) async {
    return await invoicesRepository.addInvoice(invoiceRequestModel);
  }
}
