import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/register_response_model.dart';
import '../repositories/auth_repository.dart';

class ResendCodeUseCase {
  final AuthRepository authRepository;
  ResendCodeUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, RegisterResponse>> call({required int userId}) async {
    return await authRepository.resendCode(userId: userId);
  }
}