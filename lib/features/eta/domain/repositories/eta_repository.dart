import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/add_eta_connection.dart';
import '../entities/eta_connections_result.dart';
import '../entities/eta_lookups_result.dart';

abstract class ETARepository {

  Future<Either<Failure, EtaConnectionResult>> getETA({required int companyId});
  Future<Either<Failure, AddEtaConnectionResult>> addETA({required int companyId, required AddETAModel addETAModel});
  Future<Either<Failure, EtaConnectionLookupsResult>> getETALookups();
}
