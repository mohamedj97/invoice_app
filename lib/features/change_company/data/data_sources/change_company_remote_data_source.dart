import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/get_company_users_result.dart';

abstract class ChangeCompanyRemoteDataSource {
  Future<GetUsersCompaniesResult> getUserCompanies();
  Future<BoolResponse> changeCompany({required int companyId});
}

class ChangeCompanyRemoteDataSourceImpl extends ChangeCompanyRemoteDataSource {
  final APIRepository apiRepo;
  ChangeCompanyRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<BoolResponse> changeCompany({required int companyId}) async{
    final response = await apiRepo.changeCompanyClient.changeCompany(companyId);
    return response;
  }

  @override
  Future<GetUsersCompaniesResult> getUserCompanies() async{
    final response = await apiRepo.changeCompanyClient.getUserCompanies();
    return response;
  }

}