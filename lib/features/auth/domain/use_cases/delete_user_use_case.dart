import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class DeleteUserUseCase {
  final AuthRepository authRepository;
  DeleteUserUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, BoolResponse>> call({required int userId}) async {
    return await authRepository.deleteUser(userId: userId);
  }
}