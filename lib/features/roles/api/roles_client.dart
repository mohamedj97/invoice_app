import 'package:dio/dio.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';

part 'roles_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class RolesClient {
  factory RolesClient(Dio dio, {String baseUrl}) = _RolesClient;

  @GET(EndPoints.companyRoles)
  Future<GetRolesResponse> getCompanyRoles();

}
