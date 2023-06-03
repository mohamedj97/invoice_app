import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../company_registration/data/models/responses/get_company_lookups_response_model.dart';
import '../models/responses/change_password_request_model.dart';
import '../models/responses/get_profile_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<GetProfileResponse> getProfile();
  Future<StringResponse> changePassword(ChangePasswordModel changePasswordModel);
  Future<GetCompanyLookupsResponse> getCompanyLookupsDataForProfile();
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
  @override
  Future<StringResponse> changePassword(ChangePasswordModel changePasswordModel) async {
    final response = await apiRepo.profileClient.changePassword(changePasswordModel);

    return response;
  }

  @override
  Future<GetCompanyLookupsResponse> getCompanyLookupsDataForProfile() async{
    final response = await apiRepo.profileClient.getCompanyLookupsDataForProfile();

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