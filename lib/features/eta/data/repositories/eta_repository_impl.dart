import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/eta/data/data_sources/eta_remote_data_source.dart';
import 'package:invoice_app/features/eta/domain/entities/add_eta_connection.dart';
import 'package:invoice_app/features/eta/domain/entities/eta_connections_result.dart';
import 'package:invoice_app/features/eta/domain/entities/eta_lookups_result.dart';
import 'package:invoice_app/features/eta/domain/repositories/eta_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';

class ETARepositoryImpl extends ETARepository with ConnectivityMixin {
  final ETARemoteDataSource etaRemoteDataSource;

  ETARepositoryImpl(this.etaRemoteDataSource);


  @override
  Future<Either<Failure, AddEtaConnectionResult>> addETA({required int companyId, required AddETAModel addETAModel}) async{
    try {
      final response = await etaRemoteDataSource.addETA(companyId: companyId, addETAModel: addETAModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, EtaConnectionResult>> getETA({required int companyId}) async{
    try {
      final response = await etaRemoteDataSource.getETA(companyId: companyId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, EtaConnectionLookupsResult>> getETALookups() async{
    try {
      final response = await etaRemoteDataSource.getETALookups();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

}
