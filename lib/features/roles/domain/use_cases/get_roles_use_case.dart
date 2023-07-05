import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';

class GetRolesUseCase {
  final RolesRepository rolesRepository;
  GetRolesUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetRolesResponse>> call(int companyId) async {
    return await rolesRepository.getCompanyRoles(companyId);
  }
}
