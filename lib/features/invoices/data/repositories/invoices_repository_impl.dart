import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/invoices/data/models/requests/invoice_filter_model.dart';
import 'package:invoice_app/features/invoices/data/models/requests/invoice_request_model.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_types_response_model.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_single_invoice_response_model.dart';
import 'package:invoice_app/features/invoices/domain/repositories/invoices_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/invoices_remote_data_source.dart';

class InvoicesRepositoryImpl extends InvoicesRepository with ConnectivityMixin {
  final InvoicesRemoteDataSource invoicesRemoteDataSource;

  InvoicesRepositoryImpl(this.invoicesRemoteDataSource);

  @override
  Future<Either<Failure, GetInvoicesResponse>> getInvoices() async {
    try {
      final response = await invoicesRemoteDataSource.getInvoices();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetInvoiceTypesResponse>> getInvoiceLookups() async {
    try {
      final response = await invoicesRemoteDataSource.getInvoiceLookups();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StringResponse>> addInvoice(InvoiceRequestModel invoiceRequestModel)async {
    try {
      final response = await invoicesRemoteDataSource.addInvoice(invoiceRequestModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetInvoicesResponse>> filterInvoices(InvoiceFilterModel invoiceFilterModel) async{
    try {
      final response = await invoicesRemoteDataSource.filterInvoices(invoiceFilterModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, StringResponse>> editSingleInvoices(int id, InvoiceRequestModel invoiceRequestModel) async{
    try {
      final response = await invoicesRemoteDataSource.editSingleInvoices(id,invoiceRequestModel);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetSingleInvoiceResponse>> getSingleInvoices(int id) async{
    try {
      final response = await invoicesRemoteDataSource.getSingleInvoices(id);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
