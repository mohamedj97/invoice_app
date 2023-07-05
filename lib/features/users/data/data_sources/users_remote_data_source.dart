import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/add_user_results.dart';
import '../../domain/entities/user_request.dart';
import '../models/responses/get_user_lookup_response_model.dart';
import '../models/responses/get_users_response_model.dart';

abstract class UsersRemoteDataSource {
  Future<GetUsersResponse> getCompanyUsers(int companyId);
  Future<AddUserResult> getSingleUser({required int id});
  Future<GetUserLookupResponse> getCompanyUserLookup({required int id});
  Future<BoolResponse> editUser({required int id,required UserRequest userRequest});
  Future<AddUserResult> addUser({required UserRequest userRequest});
}

class UsersRemoteDataSourceImpl extends UsersRemoteDataSource {
  final APIRepository apiRepo;

  UsersRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<GetUsersResponse> getCompanyUsers(int companyId) async {
    final response = await apiRepo.usersClient.getCompanyUsers(companyId);
    return response;
  }

  @override
  Future<AddUserResult> getSingleUser({required int id}) async {
    final response = await apiRepo.usersClient.getSingleUser(id);
    return response;
  }

  @override
  Future<GetUserLookupResponse> getCompanyUserLookup({required int id}) async{
    final response = await apiRepo.usersClient.getCompanyUserLookup(id);
    return response;
  }

  @override
  Future<AddUserResult> addUser({required UserRequest userRequest}) async{
    final response = await apiRepo.usersClient.addUser(userRequest);
    return response;
  }

  @override
  Future<BoolResponse> editUser({required int id,required UserRequest userRequest}) async{
    final response = await apiRepo.usersClient.editUser(id,userRequest);
    return response;
  }
}
