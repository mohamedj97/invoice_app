import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/invoice_filter_model.dart';
import '../data/models/requests/invoice_request_model.dart';
import '../data/models/responses/get_invoices_response_model.dart';
import '../data/models/responses/get_invoices_types_response_model.dart';

part 'invoices_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class InvoicesClient {
  factory InvoicesClient(Dio dio, {String baseUrl}) = _InvoicesClient;

  @GET(EndPoints.getInvoices)
  Future<GetInvoicesResponse> getInvoices();

  @POST(EndPoints.getInvoices)
  Future<StringResponse> addInvoice(@Body() InvoiceRequestModel invoiceRequestModel);

  @POST(EndPoints.filterInvoices)
  Future<GetInvoicesResponse> filterInvoices(@Body() InvoiceFilterModel invoiceFilterModel);

  @GET(EndPoints.getInvoiceLookups)
  Future<GetInvoiceTypesResponse> getInvoiceLookups();
}
