import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';
import '../repositories/invoices_repository.dart';

class GetInvoicesUseCase {
  final InvoicesRepository invoicesRepository;
  GetInvoicesUseCase({
    required this.invoicesRepository,
  });

  Future<Either<Failure, GetInvoicesResponse>> call() async {
    return await invoicesRepository.getInvoices();
  }
}
