import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/login_response_model.dart';
import '../entities/login_request.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, LoginResponse>> call(LoginRequest loginRequest) async {
    return await authRepository.login(loginRequest);
  }
}
