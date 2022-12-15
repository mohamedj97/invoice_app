import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import 'package:invoice_app/features/products/domain/repositories/products_repositories.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';

class ProductsRepositoryImpl extends ProductsRepository with ConnectivityMixin {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, GetProductsResponse>> getProducts() async {
    try {
      final response = await productsRemoteDataSource.getProducts();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, BoolResponse>> addProduct(ProductModel productModel) async{
    try {
      final response = await productsRemoteDataSource.addProduct(productModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
