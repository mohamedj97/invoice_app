import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/add_product_response_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, GetProductsResponse>> getProducts();
  Future<Either<Failure, AddProductResponse>> addProduct(ProductModel productModel);
}
