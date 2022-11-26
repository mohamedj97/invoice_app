import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';

abstract class InvoicesRepository {
  Future<Either<Failure, GetInvoicesResponse>> getInvoices();
}
