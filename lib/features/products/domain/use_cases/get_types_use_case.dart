import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/products/domain/repositories/products_repositories.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_item_types_response_model.dart';

class GetItemTypesUseCase {
  final ProductsRepository productsRepository;
  GetItemTypesUseCase({
    required this.productsRepository,
  });

  Future<Either<Failure, GetItemTypesResponse>> call() async {
    return await productsRepository.getItemTypes();
  }
}
