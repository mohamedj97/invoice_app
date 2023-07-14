import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../domain/entities/add_eta_connection.dart';
import '../domain/entities/eta_connections_result.dart';
import '../domain/entities/eta_lookups_result.dart';

part 'eta_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ETAClient {
  factory ETAClient(Dio dio, {String baseUrl}) = _ETAClient;

  @GET(EndPoints.getETAConnections)
  Future<EtaConnectionResult> getETA(int companyId);

  @POST(EndPoints.addETAConnections)
  Future<AddEtaConnectionResult> addETA(int companyId,@Body() AddETAModel addETAModel);


  @GET(EndPoints.getETALookups)
  Future<EtaConnectionLookupsResult> getETALookups();
}
