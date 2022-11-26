import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/invoices/data/models/responses/get_invoices_response_model.dart';
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
}
