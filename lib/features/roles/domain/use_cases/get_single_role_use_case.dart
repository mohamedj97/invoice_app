import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_single_role_response_model.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';

class GetSingleRoleRoleUseCase {
  final RolesRepository rolesRepository;
  GetSingleRoleRoleUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetSingleRoleResponse>> call({required int id}) async {
    return await rolesRepository.getSingleRole(id: id);
  }
}
