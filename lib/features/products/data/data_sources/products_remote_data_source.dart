import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';

import '../../../../../core/api/api_repo.dart';

abstract class ProductsRemoteDataSource {
  Future<GetProductsResponse> getProducts();
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final APIRepository apiRepo;
  ProductsRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetProductsResponse> getProducts() async {
    final response = await apiRepo.productsClient.getProducts();

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