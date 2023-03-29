import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_item_types_response_model.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import 'package:invoice_app/features/products/domain/repositories/products_repositories.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../models/requests/get_products_request_model.dart';
import '../models/responses/add_product_response_model.dart';

class ProductsRepositoryImpl extends ProductsRepository with ConnectivityMixin {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepositoryImpl(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, GetProductsResponse>> getProducts(ProductFilterGenericFilterModel invoiceFilterGenericFilterModel) async {
    try {
      final response = await productsRemoteDataSource.getProducts(invoiceFilterGenericFilterModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddProductResponse>> addProduct(ProductModel productModel) async{
    try {
      final response = await productsRemoteDataSource.addProduct(productModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StringResponse>> editProduct(int id,ProductModel productModel) async{
    try {
      final response = await productsRemoteDataSource.editProduct(id,productModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetItemTypesResponse>> getItemTypes() async{
    try {
      final response = await productsRemoteDataSource.getItemTypes();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
