import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_features_response_model.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/failure.dart';

class GetFeaturesUseCase {
  final RolesRepository rolesRepository;
  GetFeaturesUseCase({
    required this.rolesRepository,
  });

  Future<Either<Failure, GetFeaturesResponse>> call() async {
    return await rolesRepository.getFeatures();
  }
}
