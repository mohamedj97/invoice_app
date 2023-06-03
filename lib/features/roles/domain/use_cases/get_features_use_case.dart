import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_fetaures_result.dart';

class GetFeaturesUseCase {
  final RolesRepository rolesRepository;
  GetFeaturesUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetFeaturesResult>> call() async {
    return await rolesRepository.getFeatures();
  }
}
