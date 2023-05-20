import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/domain/entities/role.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';

class EditRoleUseCase {
  final RolesRepository rolesRepository;
  EditRoleUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, BoolResponse>> call({required int id,required Role role}) async {
    return await rolesRepository.editRole(id: id,role: role);
  }
}
