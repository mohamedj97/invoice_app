import '../../../../../core/api/api_repo.dart';
import '../models/responses/get_profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<GetProfileResponse> getProfile();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final APIRepository apiRepo;
  ProfileRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetProfileResponse> getProfile() async {
    final response = await apiRepo.profileClient.getProfile();

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