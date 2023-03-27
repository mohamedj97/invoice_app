import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/company_register_request_model.dart';

part 'company_registration_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class CompanyRegistrationClient {
  factory CompanyRegistrationClient(Dio dio, {String baseUrl}) = _CompanyRegistrationClient;

  @POST(EndPoints.registerCompany)
  Future<IntResponse> registerCompany(@Body() CompanyRegisterRequestModel companyRegisterRequest, int userId);

}