import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/repository/memory_repo.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/base_api_response.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/responses/change_password_request_model.dart';
import '../data/models/responses/get_profile_response_model.dart';

part 'profile_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ProfileClient {
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @GET(EndPoints.getProfile)
  Future<GetProfileResponse> getProfile();

  @POST(EndPoints.changePassword)
  Future<StringResponse> changePassword(@Body()  ChangePasswordModel changePasswordModel);
}
