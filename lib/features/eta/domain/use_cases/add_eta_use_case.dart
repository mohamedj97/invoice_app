import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/add_eta_connection.dart';
import '../repositories/eta_repository.dart';

class AddETAUseCase {
  final ETARepository etaRepository;
  AddETAUseCase({
    required this.etaRepository,
  });

  Future<Either<Failure, AddEtaConnectionResult>> call({required int companyId, required AddETAModel addETAModel}) async {
    return await etaRepository.addETA(companyId: companyId,addETAModel:addETAModel);
  }
}
