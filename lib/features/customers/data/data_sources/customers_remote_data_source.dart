import '../../../../../core/api/api_repo.dart';
import '../models/requests/customer_request_model.dart';
import '../models/responses/add_customer_response_model.dart';
import '../models/responses/get_customers_response_model.dart';

abstract class CustomersRemoteDataSource {
  Future<GetCustomersResponse> getCustomers();
  Future<AddCustomerResponse> addCustomer(CustomerModelModel customerModel);
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

  @override
  Future<AddCustomerResponse> addCustomer(CustomerModelModel customerModel) async{
    final response = await apiRepo.customersClient.addCustomer(customerModel);

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