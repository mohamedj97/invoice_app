import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/get_products_request_model.dart';
import '../../data/models/responses/add_product_response_model.dart';
import '../../data/models/responses/get_item_types_response_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, GetProductsResponse>> getProducts(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel);
  Future<Either<Failure, GetItemTypesResponse>> getItemTypes();
  Future<Either<Failure, AddProductResponse>> addProduct(ProductModel productModel);
  Future<Either<Failure, StringResponse>> editProduct(int id,ProductModel productModel);
}
