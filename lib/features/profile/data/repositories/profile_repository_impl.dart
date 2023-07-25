
import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/company_registration/data/models/responses/get_company_lookups_response_model.dart';

import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../../domain/entities/change_password_request.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/responses/change_password_request_model.dart';
import '../models/responses/get_profile_response_model.dart';
import 'package:invoice_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository with ConnectivityMixin {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, GetProfileResponse>> getProfile() async {
    try {
      final response = await profileRemoteDataSource.getProfile();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, BoolResponse>> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await profileRemoteDataSource.changePassword(ChangePasswordModel(
        changePasswordRequest.Username,
        changePasswordRequest.CurrentPassword,
        changePasswordRequest.NewPassword,
        changePasswordRequest.ConfirmNewPassword,
      ));

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetCompanyLookupsResponse>> getCompanyLookupsDataForProfile() async{
    try {
      final response = await profileRemoteDataSource.getCompanyLookupsDataForProfile();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
