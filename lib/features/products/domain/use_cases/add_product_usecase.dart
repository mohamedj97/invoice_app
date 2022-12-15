import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/products/data/models/requests/product_request_model.dart';
import 'package:invoice_app/features/products/domain/repositories/products_repositories.dart';
import '../../../../core/error/failure.dart';

class AddProductUseCase {
  final ProductsRepository productsRepository;
  AddProductUseCase({
    required this.productsRepository,
  });

  Future<Either<Failure, BoolResponse>> call(ProductModel productModel) async {
    return await productsRepository.addProduct(productModel);
  }
}
