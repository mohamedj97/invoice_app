import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/profile/domain/repositories/profile_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../company_registration/data/models/responses/get_company_lookups_response_model.dart';

class GetCompanyLookupsForProfileUseCase {
  final ProfileRepository profileRepository;
  GetCompanyLookupsForProfileUseCase({
    required this.profileRepository,
  });

  Future<Either<Failure, GetCompanyLookupsResponse>> call() async {
    return await profileRepository.getCompanyLookupsDataForProfile();
  }
}
