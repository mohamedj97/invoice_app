import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_profile_response_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, GetProfileResponse>> getProfile();
}
