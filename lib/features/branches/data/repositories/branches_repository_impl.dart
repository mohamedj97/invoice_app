import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/branches/data/data_sources/branches_remote_data_source.dart';
import 'package:invoice_app/features/branches/data/models/responses/get_branches_response_model.dart';
import 'package:invoice_app/features/branches/domain/repositories/branches_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';

class BranchesRepositoryImpl extends BranchesRepository with ConnectivityMixin {
  final BranchesRemoteDataSource branchesRemoteDataSource;

  BranchesRepositoryImpl(this.branchesRemoteDataSource);

  @override
  Future<Either<Failure, GetBranchesResponse>> getCompanyBranches() async{
    try {
      final response = await branchesRemoteDataSource.getCompanyBranches();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

}
