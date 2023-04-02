import 'package:invoice_app/core/api/base_api_response.dart';

import '../../../../../core/api/api_repo.dart';
import '../models/requests/customer_request_model.dart';
import '../models/requests/get_customers_request_model.dart';
import '../models/responses/add_customer_response_model.dart';
import '../models/responses/get_customer_types_response_model.dart';
import '../models/responses/get_customers_response_model.dart';

abstract class CustomersRemoteDataSource {
  Future<GetCustomersResponse> getCustomers(CustomerFilterGenericFilterModel customerFilterGenericFilterModel);
  Future<AddCustomerResponse> addCustomer(CustomerModelModel customerModel);
  Future<StringResponse> editCustomer(int id,CustomerModelModel customerModel);
  Future<GetCustomerTypesResponse> getCustomersLookUps();
}

class CustomersRemoteDataSourceImpl extends CustomersRemoteDataSource {
  final APIRepository apiRepo;
  CustomersRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetCustomersResponse> getCustomers(CustomerFilterGenericFilterModel customerFilterGenericFilterModel) async {
    final response = await apiRepo.customersClient.getCustomers(customerFilterGenericFilterModel);

    return response;
  }

  @override
  Future<AddCustomerResponse> addCustomer(CustomerModelModel customerModel) async{
    final response = await apiRepo.customersClient.addCustomer(customerModel);

    return response;
  }

  @override
  Future<GetCustomerTypesResponse> getCustomersLookUps() async{
    final response = await apiRepo.customersClient.getCustomersLookUps();

    return response;
  }

  @override
  Future<StringResponse> editCustomer(int id, CustomerModelModel customerModel)async {
    final response = await apiRepo.customersClient.editCustomer(id, customerModel);

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