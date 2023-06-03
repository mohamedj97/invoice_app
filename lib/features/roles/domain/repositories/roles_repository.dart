import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_fetaures_result.dart';
import '../entities/get_single_role_result.dart';
import '../entities/role.dart';

abstract class RolesRepository {
  Future<Either<Failure, GetRolesResponse>> getCompanyRoles();

  Future<Either<Failure, GetSingleRoleResult>> getSingleRole({required int id});

  Future<Either<Failure, BoolResponse>> editRole({required int id, required Role role});

  Future<Either<Failure, GetSingleRoleResult>> addRole({required Role role});

  Future<Either<Failure, GetFeaturesResult>> getFeatures();
}
