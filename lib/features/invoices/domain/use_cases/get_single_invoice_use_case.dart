import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_single_invoice_response_model.dart';

class GetSingleInvoiceUseCase {
  final InvoicesRepository invoicesRepository;
  GetSingleInvoiceUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetSingleInvoiceResponse>> call(int id) async {
    return await invoicesRepository.getSingleInvoices(id);
  }
}
