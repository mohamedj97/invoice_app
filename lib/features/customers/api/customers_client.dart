import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/strings/end_points.dart';
import '../data/models/responses/get_customers_response_model.dart';

part 'customers_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class CustomersClient {
  factory CustomersClient(Dio dio, {String baseUrl}) = _CustomersClient;

  @GET(EndPoints.getCustomers)
  Future<GetCustomersResponse> getCustomers();
}
