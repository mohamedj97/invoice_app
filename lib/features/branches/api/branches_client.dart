import 'package:dio/dio.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/base_api_response.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/responses/add_branch_response_model.dart';
import '../data/models/responses/get_branches_response_model.dart';

part 'branches_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class BranchesClient {
  factory BranchesClient(Dio dio, {String baseUrl}) = _BranchesClient;

  @GET(EndPoints.companyBranches)
  Future<GetBranchesResponse> getCompanyBranches(int companyId);

  @PUT(EndPoints.editBranch)
  Future<BoolResponse> editBranch(int id,@Body() CompanyBranch companyBranch);

  @POST(EndPoints.addBranch)
  Future<AddBranchResponse> addBranch(@Body() CompanyBranch companyBranch);
}
