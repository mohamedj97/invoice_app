import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/customer_request_model.dart';
import '../repositories/customers_repository.dart';

class EditCustomerUseCase {
  final CustomersRepository customersRepository;
  EditCustomerUseCase({
    required this.customersRepository,
  });

  Future<Either<Failure, BoolResponse>> call(int id,CustomerModelModel customerModel) async {
    return await customersRepository.editCustomer(id,customerModel);
  }
}
