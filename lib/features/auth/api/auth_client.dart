import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/strings/end_points.dart';
import '../data/models/requests/login_request_model.dart';
import '../data/models/responses/login_response_model.dart';
part 'auth_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginModel loginRequest);
}
