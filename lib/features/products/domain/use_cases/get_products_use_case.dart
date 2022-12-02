import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/products/data/models/responses/get_products_response_model.dart';
import 'package:invoice_app/features/products/domain/repositories/products_repositories.dart';
import '../../../../core/error/failure.dart';

class GetProductsUseCase {
  final ProductsRepository productsRepository;
  GetProductsUseCase({
    required this.productsRepository,
  });

  Future<Either<Failure, GetProductsResponse>> call() async {
    return await productsRepository.getProducts();
  }
}
