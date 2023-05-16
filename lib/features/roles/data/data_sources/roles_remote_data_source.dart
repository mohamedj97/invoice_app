import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import '../../../../../core/api/api_repo.dart';

abstract class RolesRemoteDataSource {
  Future<GetRolesResponse> getCompanyRoles();
}

class RolesRemoteDataSourceImpl extends RolesRemoteDataSource {
  final APIRepository apiRepo;
  RolesRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<GetRolesResponse> getCompanyRoles()async {
    final response = await apiRepo.rolesClient.getCompanyRoles();
    return response;
  }
}