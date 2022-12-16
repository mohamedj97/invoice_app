import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_customer_types_response_model.dart';

class GetCustomerTypesUseCase {
  final CustomersRepository customersRepository;
  GetCustomerTypesUseCase({
    required this.customersRepository,
  });

  Future<Either<Failure, GetCustomerTypesResponse>> call() async {
    return await customersRepository.getCustomersLookUps();
  }
}
