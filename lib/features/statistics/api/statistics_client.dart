import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/responses/get_submitted_invoices_response_model.dart';
part 'statistics_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class StatisticsClient {
  factory StatisticsClient(Dio dio, {String baseUrl}) = _StatisticsClient;

  @GET(EndPoints.receivedInvoices)
  Future<GetSubmittedInvoiceResponse> getReceivedInvoices();

  @GET(EndPoints.submittedInvoices)
  Future<GetSubmittedInvoiceResponse> getSubmittedInvoices();
}
