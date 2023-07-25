import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../../company_registration/data/models/responses/get_company_lookups_response_model.dart';
import '../../data/models/responses/get_profile_response_model.dart';
import '../entities/change_password_request.dart';

abstract class ProfileRepository {
  Future<Either<Failure, GetProfileResponse>> getProfile();
  Future<Either<Failure, BoolResponse>> changePassword(ChangePasswordRequest changePasswordRequest);
  Future<Either<Failure, GetCompanyLookupsResponse>> getCompanyLookupsDataForProfile();
}
