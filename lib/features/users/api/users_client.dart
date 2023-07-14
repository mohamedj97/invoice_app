import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/users/data/models/responses/get_users_response_model.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/responses/get_user_lookup_response_model.dart';
import '../domain/entities/add_user_results.dart';

part 'users_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class UsersClient {
  factory UsersClient(Dio dio, {String baseUrl}) = _UsersClient;

  @GET(EndPoints.companyUsers)
  Future<GetUsersResponse> getCompanyUsers(int companyId);

  @GET(EndPoints.getSingleUser)
  Future<AddUserResult> getSingleUser(int id);

  @GET(EndPoints.getCompanyUserLookup)
  Future<GetUserLookupResponse> getCompanyUserLookup(int id);

  @PUT(EndPoints.editUser)
  Future<BoolResponse> editUser(int id, @Body() UserRequest userRequest);

  @POST(EndPoints.addUser)
  Future<AddUserResult> addUser(@Body() UserRequest userRequest);
}
