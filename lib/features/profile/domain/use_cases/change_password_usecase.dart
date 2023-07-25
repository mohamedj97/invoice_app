import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/profile/domain/repositories/profile_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/change_password_request.dart';

class ChangePasswordUseCase {
  final ProfileRepository profileRepository;
  ChangePasswordUseCase({
    required this.profileRepository,
  });

  Future<Either<Failure, BoolResponse>> call(ChangePasswordRequest changePasswordRequest) async {
    return await profileRepository.changePassword(changePasswordRequest);
  }
}
