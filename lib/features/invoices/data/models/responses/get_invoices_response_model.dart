import 'package:invoice_app/features/invoices/domain/entities/invoice_head_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';

part 'get_invoices_response_model.g.dart';

@JsonSerializable()
class GetInvoicesResponseDataModel extends InvoiceHeadModel {
  GetInvoicesResponseDataModel({
    required super.id,
    super.invoiceNo,
    required super.invoiceDate,
    super.direction,
    super.companyCode,
    super.companyName,
    required super.companyTaxRegId,
    super.companyCountry,
    super.companyGovernate,
    super.companyCity,
    super.companyStreet,
    super.companyBuildingNo,
    super.customerCode,
    super.customerName,
    super.customerTaxRegId,
    super.customerCountry,
    super.customerGovernate,
    super.customerCity,
    super.customerStreet,
    super.customerBuildingNo,
    super.poNo,
    super.poDesc,
    super.soNo,
    super.soDesc,
    super.performaNo,
    super.bankName,
    super.bankAddress,
    super.bankAccountNo,
    super.bankAccountIban,
    super.swiftCode,
    super.paymentTerms,
    super.approch,
    super.packaging,
    super.dateValidity,
    super.exportPort,
    super.countryOfOrigin,
    super.grossWeight,
    super.netWeight,
    super.deliveryTerms,
    super.invoiceTypeCode,
    super.invoiceTypeName,
    super.extraDiscountAmount,
    super.totalSalesAmount,
    super.totalDiscountAmount,
    super.netAmount,
    super.totalItemDiscountAmount,
    super.totalAmount,
    super.invoiceLinesCount,
    super.reference,
    required super.companyId,
    required  super.branchId,
    required super.companyActivityId,
    super.companyActivityCode,
    super.companyActivityName,
    super.companyCountryCode,
   required super.customerId,
    super.invoiceType,
    super.invId,
    super.uuid,
    super.status,
    super.statusCode,
    super.details,
  });

  factory GetInvoicesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetInvoicesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetInvoicesResponse extends BaseAPIResponse {
  late List<GetInvoicesResponseDataModel>? result;

  GetInvoicesResponse({
    required super.statusCode,
    super.errorMessage,
    required this.result,
  });

  factory GetInvoicesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetInvoicesResponseFromJson(json!);
}
