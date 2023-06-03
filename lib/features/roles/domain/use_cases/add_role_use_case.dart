import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_single_role_result.dart';
import '../entities/role.dart';

class AddRoleUseCase {
  final RolesRepository rolesRepository;
  AddRoleUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetSingleRoleResult>> call({required Role role}) async {
    return await rolesRepository.addRole(role: role);
  }
}
