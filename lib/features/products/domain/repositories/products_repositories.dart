import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import '../../../../core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, GetProductsResponse>> getProducts();
}
