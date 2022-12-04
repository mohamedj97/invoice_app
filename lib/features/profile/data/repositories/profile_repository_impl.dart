
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/profile_remote_data_source.dart';
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
}
