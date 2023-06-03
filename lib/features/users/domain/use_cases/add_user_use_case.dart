import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import '../../../../core/error/failure.dart';
import '../entities/add_user_results.dart';
import '../repositories/users_repositories.dart';

class AddUserUseCase {
  final UsersRepository usersRepository;
  AddUserUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, AddUserResult>> call({required UserRequest userRequest}) async {
    return await usersRepository.addUser(userRequest: userRequest);
  }
}
