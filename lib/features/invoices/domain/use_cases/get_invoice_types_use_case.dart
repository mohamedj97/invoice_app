import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_invoices_types_response_model.dart';

class GetInvoiceTypesUseCase {
  final InvoicesRepository invoicesRepository;
  GetInvoiceTypesUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetInvoiceTypesResponse>> call() async {
    return await invoicesRepository.getInvoiceLookups();
  }
}
