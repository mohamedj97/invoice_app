import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import '../../../../core/error/failure.dart';

abstract class RolesRepository {
  Future<Either<Failure, GetRolesResponse>> getCompanyRoles();
}
