import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_features_response_model.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_single_role_response_model.dart';
import '../entities/role.dart';

abstract class RolesRepository {
  Future<Either<Failure, GetRolesResponse>> getCompanyRoles();

  Future<Either<Failure, GetSingleRoleResponse>> getSingleRole({required int id});

  Future<Either<Failure, BoolResponse>> editRole({required int id, required Role role});

  Future<Either<Failure, GetSingleRoleResponse>> addRole({required Role role});

  Future<Either<Failure, GetFeaturesResponse>> getFeatures();
}
