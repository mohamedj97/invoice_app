import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/invoice_filter_model.dart';
import '../repositories/invoices_repository.dart';

class FilterInvoicesUseCase {
  final InvoicesRepository invoicesRepository;
  FilterInvoicesUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetInvoicesResponse>> call(InvoiceFilterModel invoiceFilterModel) async {
    return await invoicesRepository.filterInvoices(invoiceFilterModel);
  }
}
