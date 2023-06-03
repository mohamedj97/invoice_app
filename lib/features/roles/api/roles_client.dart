import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../domain/entities/get_fetaures_result.dart';
import '../domain/entities/get_single_role_result.dart';
import '../domain/entities/role.dart';

part 'roles_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class RolesClient {
  factory RolesClient(Dio dio, {String baseUrl}) = _RolesClient;

  @GET(EndPoints.companyRoles)
  Future<GetRolesResponse> getCompanyRoles();

  @GET(EndPoints.getSingleRole)
  Future<GetSingleRoleResult> getSingleRole(int id);

  @PUT(EndPoints.editRole)
  Future<BoolResponse> editRole(int id, @Body() Role role);

  @POST(EndPoints.addRole)
  Future<GetSingleRoleResult> addRole(@Body() Role role);

  @GET(EndPoints.getFeatures)
  Future<GetFeaturesResult> getFeatures();
}
