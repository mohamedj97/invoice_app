import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/validate_code_response_model.dart';
import '../repositories/auth_repository.dart';

class ValidateCodeUseCase {
  final AuthRepository authRepository;
  ValidateCodeUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, ValidateCodeResponse>> call({required int userId,required String securityCode}) async {
    return await authRepository.validateSecurityCode(securityCode: securityCode,userId: userId);
  }
}
