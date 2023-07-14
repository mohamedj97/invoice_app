import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/eta_lookups_result.dart';
import '../repositories/eta_repository.dart';

class GetETALookupsUseCase {
  final ETARepository etaRepository;
  GetETALookupsUseCase({
    required this.etaRepository,
  });

  Future<Either<Failure, EtaConnectionLookupsResult>> call() async {
    return await etaRepository.getETALookups();
  }
}
