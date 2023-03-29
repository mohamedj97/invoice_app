import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/get_invoices_request_model.dart';
import '../repositories/invoices_repository.dart';

class GetInvoicesUseCase {
  final InvoicesRepository invoicesRepository;
  GetInvoicesUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetInvoicesResponse>> call(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel) async {
    return await invoicesRepository.getInvoices(invoiceFilterGenericFilterModel);
  }
}
