import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/add_user_results.dart';
import '../repositories/users_repositories.dart';

class GetSingleUserUseCase {
  final UsersRepository usersRepository;
  GetSingleUserUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, AddUserResult>> call({required int id}) async {
    return await usersRepository.getSingleUser(id: id);
  }
}
