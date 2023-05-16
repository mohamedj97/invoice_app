import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/responses/get_branches_response_model.dart';

part 'branches_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class BranchesClient {
  factory BranchesClient(Dio dio, {String baseUrl}) = _BranchesClient;

  @GET(EndPoints.companyBranches)
  Future<GetBranchesResponse> getCompanyBranches();

}
