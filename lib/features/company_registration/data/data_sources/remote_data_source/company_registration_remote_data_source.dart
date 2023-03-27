import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../../core/api/api_repo.dart';
import '../../models/requests/company_register_request_model.dart';
import '../../models/responses/get_company_lookups_response_model.dart';

abstract class CompanyRegistrationRemoteDataSource {
  Future<IntResponse> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId});
  Future<GetCompanyLookupsResponse> getCompanyLookups({required int userId});
}

class CompanyRegistrationRemoteDataSourceImpl extends CompanyRegistrationRemoteDataSource {
  final APIRepository apiRepo;

  CompanyRegistrationRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<IntResponse> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId}) async {
    final response = await apiRepo.companyRegistrationClient.registerCompany(companyRegisterRequest, userId);

    return response;
  }

  @override
  Future<GetCompanyLookupsResponse> getCompanyLookups({required int userId}) async{
    final response = await apiRepo.companyRegistrationClient.getCompanyLookups(userId: userId);

    return response;
  }
}
