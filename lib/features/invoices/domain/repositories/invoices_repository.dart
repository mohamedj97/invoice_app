import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/get_invoices_request_model.dart';
import '../../data/models/requests/invoice_request_model.dart';
import '../../data/models/responses/get_invoices_types_response_model.dart';
import '../../data/models/responses/get_single_invoice_response_model.dart';

abstract class InvoicesRepository {
  Future<Either<Failure, GetInvoicesResponse>> getInvoices(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel);
  Future<Either<Failure, GetSingleInvoiceResponse>> getSingleInvoices(int id);
  Future<Either<Failure, BoolResponse>> deleteInvoice(int id);
  Future<Either<Failure, BoolResponse>> editSingleInvoices(int id ,InvoiceRequestModel invoiceRequestModel);
  Future<Either<Failure, GetInvoiceTypesResponse>> getInvoiceLookups();
  Future<Either<Failure, GetSingleInvoiceResponse>> addInvoice(InvoiceRequestModel invoiceRequestModel);
}
