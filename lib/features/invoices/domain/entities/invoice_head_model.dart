import 'package:equatable/equatable.dart';

class InvoiceHeadModel extends Equatable {
  InvoiceHeadModel({
    required this.id,
    this.invoiceNo,
    required this.invoiceDate,
    this.direction,
    this.companyCode,
    this.companyName,
    required this.companyTaxRegId,
    this.companyCountry,
    this.companyGovernate,
    this.companyCity,
    this.companyStreet,
    this.companyBuildingNo,
    this.customerCode,
    this.customerName,
    this.customerTaxRegId,
    this.customerCountry,
    this.customerGovernate,
    this.customerCity,
    this.customerStreet,
    this.customerBuildingNo,
    this.poNo,
    this.poDesc,
    this.soNo,
    this.soDesc,
    this.performaNo,
    this.bankName,
    this.bankAddress,
    this.bankAccountNo,
    this.bankAccountIban,
    this.swiftCode,
    this.paymentTerms,
    this.approch,
    this.packaging,
    this.dateValidity,
    this.exportPort,
    this.countryOfOrigin,
    this.grossWeight,
    this.netWeight,
    this.deliveryTerms,
    this.invoiceTypeCode,
    this.invoiceTypeName,
    this.extraDiscountAmount,
    this.totalSalesAmount,
    this.totalDiscountAmount,
    this.netAmount,
    this.totalItemDiscountAmount,
    this.totalAmount,
    this.invoiceLinesCount,
    this.reference,
    required this.companyId,
    required this.branchId,
    required this.companyActivityId,
    this.companyActivityCode,
    this.companyActivityName,
    this.companyCountryCode,
    required this.customerId,
    this.invoiceType,
    this.invId,
    this.uuid,
    this.status,
    this.statusCode,
    this.details,
  });

  late int id;
  String? invoiceNo;
  late DateTime invoiceDate;
  String? direction;
  String? companyCode;
  String? companyName;
  late num companyTaxRegId;
  String? companyCountry;
  String? companyGovernate;
  String? companyCity;
  String? companyStreet;
  String? companyBuildingNo;
  String? customerCode;
  String? customerName;
  String? customerTaxRegId;
  String? customerCountry;
  String? customerGovernate;
  String? customerCity;
  String? customerStreet;
  String? customerBuildingNo;
  String? poNo;
  String? poDesc;
  String? soNo;
  String? soDesc;
  String? performaNo;
  String? bankName;
  String? bankAddress;
  String? bankAccountNo;
  String? bankAccountIban;
  String? swiftCode;
  String? paymentTerms;
  String? approch;
  String? packaging;
  DateTime? dateValidity;
  String? exportPort;
  int? countryOfOrigin;
  num? grossWeight;
  num? netWeight;
  String? deliveryTerms;
  String? invoiceTypeCode;
  String? invoiceTypeName;
  num? extraDiscountAmount;
  num? totalSalesAmount;
  num? totalDiscountAmount;
  num? netAmount;
  num? totalItemDiscountAmount;
  num? totalAmount;
  int? invoiceLinesCount;
  String? reference;
  late int companyId;
  late int branchId;
  late  int companyActivityId;
  String? companyActivityCode;
  String? companyActivityName;
  String? companyCountryCode;
  late int customerId;
  String? invoiceType;
  int? invId;
  String? uuid;
  String? status;
  int? statusCode;
  String? details;

  @override
  List<Object?> get props => [
        id,
        invoiceNo,
        invoiceDate,
        direction,
        companyCode,
        companyName,
        companyTaxRegId,
        companyCountry,
        companyGovernate,
        companyCity,
        companyStreet,
        companyBuildingNo,
        customerCode,
        customerName,
        customerTaxRegId,
        customerCountry,
        customerGovernate,
        customerCity,
        customerStreet,
        customerBuildingNo,
        poNo,
        poDesc,
        soNo,
        soDesc,
        performaNo,
        bankName,
        bankAddress,
        bankAccountNo,
        bankAccountIban,
        swiftCode,
        paymentTerms,
        approch,
        packaging,
        dateValidity,
        exportPort,
        countryOfOrigin,
        grossWeight,
        netWeight,
        deliveryTerms,
        invoiceTypeCode,
        invoiceTypeName,
        extraDiscountAmount,
        totalSalesAmount,
        totalDiscountAmount,
        netAmount,
        totalItemDiscountAmount,
        totalAmount,
        invoiceLinesCount,
        reference,
        companyId,
        branchId,
        companyActivityId,
        companyActivityCode,
        companyActivityName,
        companyCountryCode,
        customerId,
        invoiceType,
        invId,
        uuid,
        status,
        statusCode,
        details,
      ];
}
