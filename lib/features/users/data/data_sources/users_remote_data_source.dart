import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import '../../../../../core/api/api_repo.dart';
import '../../../../core/api/base_api_response.dart';
import '../../domain/entities/user_request.dart';
import '../models/responses/get_user_lookup_response_model.dart';
import '../models/responses/get_users_response_model.dart';

abstract class UsersRemoteDataSource {
  Future<GetUsersResponse> getCompanyUsers();
  Future<GetSingleUserResponse> getSingleUser({required int id});
  Future<GetUserLookupResponse> getCompanyUserLookup({required int id});
  Future<BoolResponse> editUser({required int id,required UserRequest userRequest});
  Future<GetSingleUserResponse> addUser({required UserRequest userRequest});
}

class UsersRemoteDataSourceImpl extends UsersRemoteDataSource {
  final APIRepository apiRepo;

  UsersRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<GetUsersResponse> getCompanyUsers() async {
    final response = await apiRepo.usersClient.getCompanyUsers();
    return response;
  }

  @override
  Future<GetSingleUserResponse> getSingleUser({required int id}) async {
    final response = await apiRepo.usersClient.getSingleUser(id);
    return response;
  }

  @override
  Future<GetUserLookupResponse> getCompanyUserLookup({required int id}) async{
    final response = await apiRepo.usersClient.getCompanyUserLookup(id);
    return response;
  }

  @override
  Future<GetSingleUserResponse> addUser({required UserRequest userRequest}) async{
    final response = await apiRepo.usersClient.addUser(userRequest);
    return response;
  }

  @override
  Future<BoolResponse> editUser({required int id,required UserRequest userRequest}) async{
    final response = await apiRepo.usersClient.editUser(id,userRequest);
    return response;
  }
}
