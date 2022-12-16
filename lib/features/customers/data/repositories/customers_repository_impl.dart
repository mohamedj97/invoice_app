

import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/customers/data/models/requests/customer_request_model.dart';
import 'package:invoice_app/features/customers/data/models/responses/add_customer_response_model.dart';
import 'package:invoice_app/features/customers/data/models/responses/get_customer_types_response_model.dart';
import 'package:invoice_app/features/customers/domain/repositories/customers_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/customers_remote_data_source.dart';
import '../models/responses/get_customers_response_model.dart';

class CustomersRepositoryImpl extends CustomersRepository with ConnectivityMixin {
  final CustomersRemoteDataSource customersRemoteDataSource;

  CustomersRepositoryImpl(this.customersRemoteDataSource);

  @override
  Future<Either<Failure, GetCustomersResponse>> getCustomers() async {
    try {
      final response = await customersRemoteDataSource.getCustomers();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddCustomerResponse>> addCustomer(CustomerModelModel customerModel) async{
    try {
      final response = await customersRemoteDataSource.addCustomer(customerModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetCustomerTypesResponse>> getCustomersLookUps() async{
    try {
      final response = await customersRemoteDataSource.getCustomersLookUps();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
