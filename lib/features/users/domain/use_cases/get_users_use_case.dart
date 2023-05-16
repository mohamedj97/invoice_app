import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_users_response_model.dart';
import '../repositories/users_repositories.dart';

class GetUsersUseCase {
  final UsersRepository usersRepository;
  GetUsersUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, GetUsersResponse>> call() async {
    return await usersRepository.getCompanyUsers();
  }
}
