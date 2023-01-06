import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/strings/end_points.dart';
import '../data/models/requests/login_request_model.dart';
import '../data/models/responses/login_response_model.dart';
part 'statistics_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class StatisticsClient {
  factory StatisticsClient(Dio dio, {String baseUrl}) = _StatisticsClient;

  @GET(EndPoints.receivedInvoices)
  Future<LoginResponse> getReceivedInvoices();

  @GET(EndPoints.submittedInvoices)
  Future<LoginResponse> getSubmittedInvoices();
}
