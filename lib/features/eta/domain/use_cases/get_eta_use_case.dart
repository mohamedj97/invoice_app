import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/eta_connections_result.dart';
import '../repositories/eta_repository.dart';

class GetETAUseCase {
  final ETARepository etaRepository;
  GetETAUseCase({
    required this.etaRepository,
  });

  Future<Either<Failure, EtaConnectionResult>> call({required int companyId }) async {
    return await etaRepository.getETA(companyId: companyId);
  }
}
