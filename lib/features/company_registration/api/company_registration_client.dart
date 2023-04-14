import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/company_register_request_model.dart';
import '../data/models/responses/get_company_lookups_response_model.dart';

part 'company_registration_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class CompanyRegistrationClient {
  factory CompanyRegistrationClient(Dio dio, {String baseUrl}) = _CompanyRegistrationClient;

  @POST(EndPoints.registerCompany)
  Future<IntResponse> registerCompany(@Body() CompanyRegisterRequestModel companyRegisterRequest, int userId);

  @GET(EndPoints.getCompanyLookups)
  Future<GetCompanyLookupsResponse> getCompanyLookups({required int userId});

  @POST(EndPoints.uploadLogo)
  Future<BoolResponse> uploadLogo(@Body() FormData logo,{required int id});

}
