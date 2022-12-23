import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_invoices_types_response_model.dart';

abstract class InvoicesRepository {
  Future<Either<Failure, GetInvoicesResponse>> getInvoices();
  Future<Either<Failure, GetInvoiceTypesResponse>> getInvoiceLookups();
}
