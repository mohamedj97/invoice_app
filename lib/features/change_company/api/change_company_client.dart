import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/http.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../domain/entities/get_company_users_result.dart';

part 'change_company_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ChangeCompanyClient {
  factory ChangeCompanyClient(Dio dio, {String baseUrl}) = _ChangeCompanyClient;

  @GET(EndPoints.getUserCompanies)
  Future<GetUsersCompaniesResult> getUserCompanies();

  @PUT(EndPoints.changeCompany)
  Future<BoolResponse> changeCompany(int companyId);
}
