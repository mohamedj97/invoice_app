import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import '../../../../core/error/failure.dart';
import '../repositories/users_repositories.dart';

class EditUserUseCase {
  final UsersRepository usersRepository;
  EditUserUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, BoolResponse>> call({required int id,required UserRequest userRequest}) async {
    return await usersRepository.editUser(id: id,userRequest: userRequest);
  }
}
