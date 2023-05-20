import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_single_role_response_model.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/role.dart';

class AddRoleUseCase {
  final RolesRepository rolesRepository;
  AddRoleUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetSingleRoleResponse>> call({required Role role}) async {
    return await rolesRepository.addRole(role: role);
  }
}
