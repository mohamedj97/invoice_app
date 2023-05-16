import 'package:dio/dio.dart';
import 'package:invoice_app/features/users/data/models/responses/get_users_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';

part 'users_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class UsersClient {
  factory UsersClient(Dio dio, {String baseUrl}) = _UsersClient;

  @GET(EndPoints.companyUsers)
  Future<GetUsersResponse> getCompanyUsers();

}
