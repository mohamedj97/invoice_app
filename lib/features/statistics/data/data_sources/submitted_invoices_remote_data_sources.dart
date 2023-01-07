import '../../../../../core/api/api_repo.dart';
import '../responses/get_submitted_invoices_response_model.dart';

abstract class SubmittedInvoicesRemoteDataSource {
  Future<GetSubmittedInvoiceResponse> getReceivedInvoices();
  Future<GetSubmittedInvoiceResponse> getSubmittedInvoices();
}

class SubmittedInvoicesRemoteDataSourceImpl extends SubmittedInvoicesRemoteDataSource {
  final APIRepository apiRepo;
  SubmittedInvoicesRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetSubmittedInvoiceResponse> getReceivedInvoices() async {
    final response = await apiRepo.statisticsClient.getReceivedInvoices();

    return response;
  }

  @override
  Future<GetSubmittedInvoiceResponse> getSubmittedInvoices() async{
    final response = await apiRepo.statisticsClient.getSubmittedInvoices();

    return response;
  }
}