import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/customer_request_model.dart';
import '../../data/models/responses/add_customer_response_model.dart';
import '../../data/models/responses/get_customers_response_model.dart';

abstract class CustomersRepository {
  Future<Either<Failure, GetCustomersResponse>> getCustomers();
  Future<Either<Failure, AddCustomerResponse>> addCustomer(CustomerModelModel customerModel);
}
