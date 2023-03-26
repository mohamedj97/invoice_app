import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:invoice_app/features/auth/domain/entities/register_request.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, RegisterResponse>> call(RegisterRequest registerRequest) async {
    return await authRepository.register(registerRequest);
  }
}
