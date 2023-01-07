import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/responses/get_submitted_invoices_response_model.dart';

abstract class SubmittedInvoicesRepository {
  Future<Either<Failure, GetSubmittedInvoiceResponse>> getSubmittedInvoices();
  Future<Either<Failure, GetSubmittedInvoiceResponse>> getReceivedInvoices();
}
