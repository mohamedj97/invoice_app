import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import '../../../../core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, GetProductsResponse>> getProducts();
  Future<Either<Failure, BoolResponse>> addProduct(ProductModel productModel);
}
