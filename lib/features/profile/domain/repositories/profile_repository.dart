import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_profile_response_model.dart';
import '../entities/change_password_request.dart';

abstract class ProfileRepository {
  Future<Either<Failure, GetProfileResponse>> getProfile();
  Future<Either<Failure, StringResponse>> changePassword(ChangePasswordRequest changePasswordRequest);
}
