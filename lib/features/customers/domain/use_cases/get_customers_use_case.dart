import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/customers/data/models/responses/get_customers_response_model.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/get_customers_request_model.dart';

class GetCustomersUseCase {
  final CustomersRepository customersRepository;
  GetCustomersUseCase({
    required this.customersRepository,
  });

  Future<Either<Failure, GetCustomersResponse>> call(CustomerFilterGenericFilterModel customerFilterGenericFilterModel) async {
    return await customersRepository.getCustomers(customerFilterGenericFilterModel);
  }
}
