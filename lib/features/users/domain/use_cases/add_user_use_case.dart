import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import '../../../../core/error/failure.dart';
import '../repositories/users_repositories.dart';

class AddUserUseCase {
  final UsersRepository usersRepository;
  AddUserUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, GetSingleUserResponse>> call({required UserRequest userRequest}) async {
    return await usersRepository.addUser(userRequest: userRequest);
  }
}
