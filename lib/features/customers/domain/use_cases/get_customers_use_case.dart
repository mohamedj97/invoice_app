import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/customers/data/models/responses/get_customers_response_model.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import '../../../../core/error/failure.dart';

class GetCustomersUseCase {
  final CustomersRepository customersRepository;
  GetCustomersUseCase({
    required this.customersRepository,
  });

  Future<Either<Failure, GetCustomersResponse>> call() async {
    return await customersRepository.getCustomers();
  }
}
