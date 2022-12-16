import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/customer_request_model.dart';
import '../../data/models/responses/add_customer_response_model.dart';
import '../repositories/customers_repository.dart';

class AddCustomerUseCase {
  final CustomersRepository customersRepository;
  AddCustomerUseCase({
    required this.customersRepository,
  });

  Future<Either<Failure, AddCustomerResponse>> call(CustomerModelModel customerModel) async {
    return await customersRepository.addCustomer(customerModel);
  }
}
