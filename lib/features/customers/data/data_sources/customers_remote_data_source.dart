import '../../../../../core/api/api_repo.dart';
import '../models/responses/get_customers_response_model.dart';

abstract class CustomersRemoteDataSource {
  Future<GetCustomersResponse> getCustomers();
}

class CustomersRemoteDataSourceImpl extends CustomersRemoteDataSource {
  final APIRepository apiRepo;
  CustomersRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetCustomersResponse> getCustomers() async {
    final response = await apiRepo.customersClient.getCustomers();

    return response;
  }
}


//   Future<OrganizationDTOResponse> getMyOrganizationDetails() async {
//   try {
//     final response = await _client.get(Urls.getMyOrganizationInfo);
//     return OrganizationDTOResponse.fromJson(response.data);
//   } catch (e) {
//     return OrganizationDTOResponse.fromJson(getErrorResponse(e).toJson());
//   }
// }