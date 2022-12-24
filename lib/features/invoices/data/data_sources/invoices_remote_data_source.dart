import 'package:invoice_app/core/api/base_api_response.dart';

import '../../../../../core/api/api_repo.dart';
import '../models/requests/invoice_request_model.dart';
import '../models/responses/get_invoices_response_model.dart';
import '../models/responses/get_invoices_types_response_model.dart';

abstract class InvoicesRemoteDataSource {
  Future<GetInvoicesResponse> getInvoices();
  Future<GetInvoiceTypesResponse> getInvoiceLookups();
  Future<StringResponse> addInvoice(InvoiceRequestModel invoiceRequestModel);
}

class InvoicesRemoteDataSourceImpl extends InvoicesRemoteDataSource {
  final APIRepository apiRepo;
  InvoicesRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetInvoicesResponse> getInvoices() async {
    final response = await apiRepo.invoicesClient.getInvoices();

    return response;
  }

  @override
  Future<GetInvoiceTypesResponse> getInvoiceLookups() async{
    final response = await apiRepo.invoicesClient.getInvoiceLookups();

    return response;
  }

  @override
  Future<StringResponse> addInvoice(InvoiceRequestModel invoiceRequestModel) async{
    final response = await apiRepo.invoicesClient.addInvoice(invoiceRequestModel);

    return response;
  }
}


//   Future<OrganizationDTOResponse> getMyOrganizationDetails() async {
//   try {
//     final response = await _client.get(Urls.getMyOrganizationInfo);
//     return OrganizationDTOResponse.fromJson(response.data);
//   } catch (e) {
//     return OrganizationDTOResponse.fromJson(getErrorResponse(e).toJson());
//   }
// }