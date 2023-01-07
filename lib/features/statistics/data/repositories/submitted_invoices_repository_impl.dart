import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/statistics/domain/repositories/submited_invoices_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/submitted_invoices_remote_data_sources.dart';
import '../responses/get_submitted_invoices_response_model.dart';

class SubmittedInvoicesRepositoryImpl extends SubmittedInvoicesRepository with ConnectivityMixin {
  final SubmittedInvoicesRemoteDataSource submittedInvoicesRemoteDataSource;

  SubmittedInvoicesRepositoryImpl(this.submittedInvoicesRemoteDataSource);

  @override
  Future<Either<Failure, GetSubmittedInvoiceResponse>> getReceivedInvoices() async {
    try {
      final response = await submittedInvoicesRemoteDataSource.getReceivedInvoices();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetSubmittedInvoiceResponse>> getSubmittedInvoices() async {
    try {
      final response = await submittedInvoicesRemoteDataSource.getSubmittedInvoices();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
