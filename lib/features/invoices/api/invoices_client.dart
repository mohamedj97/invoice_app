import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/get_invoices_request_model.dart';
import '../data/models/requests/invoice_request_model.dart';
import '../data/models/responses/get_invoices_response_model.dart';
import '../data/models/responses/get_invoices_types_response_model.dart';
import '../data/models/responses/get_single_invoice_response_model.dart';

part 'invoices_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class InvoicesClient {
  factory InvoicesClient(Dio dio, {String baseUrl}) = _InvoicesClient;

  @POST(EndPoints.getInvoices)
  Future<GetInvoicesResponse> getInvoices(@Body() InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel);

  @GET(EndPoints.getInvoices)
  Future<GetSingleInvoiceResponse> getSingleInvoices(int id);

  @PUT(EndPoints.getInvoices)
  Future<StringResponse> editSingleInvoices(int id,@Body() InvoiceRequestModel invoiceRequestModel);

  @POST(EndPoints.getInvoices)
  Future<StringResponse> addInvoice(@Body() InvoiceRequestModel invoiceRequestModel);


  @GET(EndPoints.getInvoiceLookups)
  Future<GetInvoiceTypesResponse> getInvoiceLookups();
}
