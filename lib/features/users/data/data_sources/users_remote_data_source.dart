import '../../../../../core/api/api_repo.dart';
import '../models/responses/get_users_response_model.dart';

abstract class UsersRemoteDataSource {
  Future<GetUsersResponse> getCompanyUsers();
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
}
