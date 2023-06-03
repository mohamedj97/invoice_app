import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_single_role_result.dart';

class GetSingleRoleRoleUseCase {
  final RolesRepository rolesRepository;
  GetSingleRoleRoleUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetSingleRoleResult>> call({required int id}) async {
    return await rolesRepository.getSingleRole(id: id);
  }
}
