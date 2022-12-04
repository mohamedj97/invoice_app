import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_profile_response_model.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;
  GetProfileUseCase({
    required this.profileRepository,
  });

  Future<Either<Failure, GetProfileResponse>> call() async {
    return await profileRepository.getProfile();
  }
}
