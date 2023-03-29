import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';

import '../../../../../core/api/api_repo.dart';
import '../models/requests/get_products_request_model.dart';
import '../models/responses/add_product_response_model.dart';
import '../models/responses/get_item_types_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<GetProductsResponse> getProducts(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel);
  Future<GetItemTypesResponse> getItemTypes();
  Future<AddProductResponse> addProduct(ProductModel productModel);
  Future<StringResponse> editProduct(int id,ProductModel productModel);
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final APIRepository apiRepo;
  ProductsRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetProductsResponse> getProducts(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel) async {
    final response = await apiRepo.productsClient.getProducts(invoiceFilterGenericFilterModel);

    return response;
  }

  @override
  Future<AddProductResponse> addProduct(ProductModel productModel) async{
    final response = await apiRepo.productsClient.addProduct(productModel);

    return response;
  }

  @override
  Future<GetItemTypesResponse> getItemTypes() async{
    final response = await apiRepo.productsClient.getItemTypes();

    return response;
  }

  @override
  Future<StringResponse> editProduct(int id,ProductModel productModel) async{
    final response = await apiRepo.productsClient.editProduct(id,productModel);

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