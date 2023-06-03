import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/get_fetaures_result.dart';
import '../../domain/entities/get_single_role_result.dart';
import '../../domain/entities/role.dart';

abstract class RolesRemoteDataSource {
  Future<GetRolesResponse> getCompanyRoles();

  Future<GetSingleRoleResult> getSingleRole({required int id});

  Future<BoolResponse> editRole({required int id, required Role role});

  Future<GetSingleRoleResult> addRole({required Role role});

  Future<GetFeaturesResult> getFeatures();
}

class RolesRemoteDataSourceImpl extends RolesRemoteDataSource {
  final APIRepository apiRepo;

  RolesRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<GetRolesResponse> getCompanyRoles() async {
    final response = await apiRepo.rolesClient.getCompanyRoles();
    return response;
  }

  @override
  Future<GetSingleRoleResult> addRole({required Role role}) async {
    final response = await apiRepo.rolesClient.addRole(role);
    return response;
  }

  @override
  Future<BoolResponse> editRole({required int id, required Role role}) async {
    final response = await apiRepo.rolesClient.editRole(id, role);
    return response;
  }

  @override
  Future<GetSingleRoleResult> getSingleRole({required int id}) async {
    final response = await apiRepo.rolesClient.getSingleRole(id);
    return response;
  }

  @override
  Future<GetFeaturesResult> getFeatures() async{
    final response = await apiRepo.rolesClient.getFeatures();
    return response;
  }
}
