import '../../../../../core/api/api_repo.dart';
import '../../models/requests/login_request_model.dart';
import '../../models/responses/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginModel loginRequest);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final APIRepository apiRepo;
  AuthRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<LoginResponse> login(LoginModel loginRequest) async {
    final response = await apiRepo.authClient.login(loginRequest);

    return response;
  }
}


//   Future<OrganizationDTOResponse> getMyOrganizationDetails() async {
//   try {
//     final response = await _client.get(Urls.getMyOrganizationInfo);
//     return OrganizationDTOResponse.fromJson(response.data);
//   } catch (e) {
//     return OrganizationDTOResponse.fromJson(getErrorResponse(e).toJson());
//   }
// }