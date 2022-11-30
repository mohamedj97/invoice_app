import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/strings/end_points.dart';
import '../data/models/responses/get_invoices_response_model.dart';

part 'invoices_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class InvoicesClient {
  factory InvoicesClient(Dio dio, {String baseUrl}) = _InvoicesClient;

  @GET(EndPoints.getInvoices)
  Future<GetInvoicesResponse> getInvoices();
}
