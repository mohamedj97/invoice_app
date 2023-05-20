import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import '../../../../core/error/failure.dart';
import '../repositories/users_repositories.dart';

class GetSingleUserUseCase {
  final UsersRepository usersRepository;
  GetSingleUserUseCase({
    required this.usersRepository,
  });

  Future<Either<Failure, GetSingleUserResponse>> call({required int id}) async {
    return await usersRepository.getSingleUser(id: id);
  }
}
