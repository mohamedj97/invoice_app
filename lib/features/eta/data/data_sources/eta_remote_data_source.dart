import '../../../../../core/api/api_repo.dart';
import '../../domain/entities/add_eta_connection.dart';
import '../../domain/entities/eta_connections_result.dart';
import '../../domain/entities/eta_lookups_result.dart';

abstract class ETARemoteDataSource {
  Future<EtaConnectionResult> getETA({required int companyId});
  Future<AddEtaConnectionResult> addETA({required int companyId, required AddETAModel addETAModel});
  Future<EtaConnectionLookupsResult> getETALookups();
}

class ETARemoteDataSourceImpl extends ETARemoteDataSource {
  final APIRepository apiRepo;
  ETARemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<AddEtaConnectionResult> addETA({required int companyId,required AddETAModel addETAModel})async {
    final response = await apiRepo.etaClient.addETA(companyId,addETAModel);
    return response;
  }

  @override
  Future<EtaConnectionResult> getETA({required int companyId}) async{
    final response = await apiRepo.etaClient.getETA(companyId);
    return response;
  }

  @override
  Future<EtaConnectionLookupsResult> getETALookups() async{
    final response = await apiRepo.etaClient.getETALookups();
    return response;
  }

}