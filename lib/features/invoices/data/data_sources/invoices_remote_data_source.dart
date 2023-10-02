import 'package:invoice_app/core/api/base_api_response.dart';

import '../../../../../core/api/api_repo.dart';
import '../models/requests/get_invoices_request_model.dart';
import '../models/requests/invoice_request_model.dart';
import '../models/responses/get_invoices_response_model.dart';
import '../models/responses/get_invoices_types_response_model.dart';
import '../models/responses/get_single_invoice_response_model.dart';

abstract class InvoicesRemoteDataSource {
  Future<GetInvoicesResponse> getInvoices(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel);
  Future<GetSingleInvoiceResponse> getSingleInvoices(int id);
  Future<BoolResponse> editSingleInvoices(int id ,InvoiceRequestModel invoiceRequestModel);
  Future<GetInvoiceTypesResponse> getInvoiceLookups();
  Future<GetSingleInvoiceResponse> addInvoice(InvoiceRequestModel invoiceRequestModel);
  Future<BoolResponse> deleteInvoice({required int id});
}

class InvoicesRemoteDataSourceImpl extends InvoicesRemoteDataSource {
  final APIRepository apiRepo;
  InvoicesRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<GetInvoicesResponse> getInvoices(InvoiceFilterGenericFilterModel invoiceFilterGenericFilterModel) async {
    final response = await apiRepo.invoicesClient.getInvoices(invoiceFilterGenericFilterModel);

    return response;
  }

  @override
  Future<GetInvoiceTypesResponse> getInvoiceLookups() async{
    final response = await apiRepo.invoicesClient.getInvoiceLookups();

    return response;
  }

  @override
  Future<GetSingleInvoiceResponse> addInvoice(InvoiceRequestModel invoiceRequestModel) async{
    final response = await apiRepo.invoicesClient.addInvoice(invoiceRequestModel);

    return response;
  }

  @override
  Future<BoolResponse> editSingleInvoices(int id, InvoiceRequestModel invoiceRequestModel) async{
    final response = await apiRepo.invoicesClient.editSingleInvoices(id,invoiceRequestModel);

    return response;
  }

  @override
  Future<GetSingleInvoiceResponse> getSingleInvoices(int id) async{
    final response = await apiRepo.invoicesClient.getSingleInvoices(id);

    return response;
  }

  @override
  Future<BoolResponse> deleteInvoice({required int id}) async{
    final response = await apiRepo.invoicesClient.deleteInvoice(id);

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