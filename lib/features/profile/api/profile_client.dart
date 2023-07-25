import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/base_api_response.dart';
import '../../../core/strings/end_points.dart';
import '../../company_registration/data/models/responses/get_company_lookups_response_model.dart';
import '../data/models/responses/change_password_request_model.dart';
import '../data/models/responses/get_profile_response_model.dart';

part 'profile_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ProfileClient {
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @GET(EndPoints.getProfile)
  Future<GetProfileResponse> getProfile();

  @GET(EndPoints.getCompanyLookupsDataForProfile)
  Future<GetCompanyLookupsResponse> getCompanyLookupsDataForProfile();

  @POST(EndPoints.changePassword)
  Future<BoolResponse> changePassword(@Body()  ChangePasswordModel changePasswordModel);
}
