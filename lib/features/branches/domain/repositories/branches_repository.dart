import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_branches_response_model.dart';

abstract class BranchesRepository {
  Future<Either<Failure, GetBranchesResponse>> getCompanyBranches();
}
