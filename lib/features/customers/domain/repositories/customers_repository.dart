import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/customer_request_model.dart';
import '../../data/models/responses/add_customer_response_model.dart';
import '../../data/models/responses/get_customer_types_response_model.dart';
import '../../data/models/responses/get_customers_response_model.dart';

abstract class CustomersRepository {
  Future<Either<Failure, GetCustomersResponse>> getCustomers();
  Future<Either<Failure, AddCustomerResponse>> addCustomer(CustomerModelModel customerModel);
  Future<Either<Failure, StringResponse>> editCustomer(int id,CustomerModelModel customerModel);
  Future<Either<Failure, GetCustomerTypesResponse>> getCustomersLookUps();
}
