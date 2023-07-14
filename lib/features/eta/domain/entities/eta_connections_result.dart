// To parse this JSON data, do
//
//     final etaConnectionResult = etaConnectionResultFromJson(jsonString);

import 'dart:convert';

EtaConnectionResult etaConnectionResultFromJson(String str) => EtaConnectionResult.fromJson(json.decode(str));

String etaConnectionResultToJson(EtaConnectionResult data) => json.encode(data.toJson());

class EtaConnectionResult {
  CompanyETAConnectionModel? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  EtaConnectionResult({
     this.result,
     this.status,
     this.statuscode,
     this.message,
     this.exception,
  });

  factory EtaConnectionResult.fromJson(Map<String, dynamic> json) => EtaConnectionResult(
    result: CompanyETAConnectionModel.fromJson(json["result"]),
    status: json["status"],
    statuscode: json["statuscode"],
    message: List<String>.from(json["message"].map((x) => x)),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "status": status,
    "statuscode": statuscode,
    "message": List<dynamic>.from(message!.map((x) => x)),
    "exception": exception,
  };
}

class CompanyETAConnectionModel {
  String? tokenDownloadUrl;
  String? invoiceTemplateUrl;
  String? invoiceDataUrl;
  int id;
  int companyId;
  String? preprodClientId;
  String? preprodClientSecret;
  DateTime? preprodExpiryDate;
  String? prodClientId;
  String? prodClientSecret;
  DateTime? prodExpiryDate;
  String? preprodEtaToken;
  DateTime? preprodEtaTokenExpiry;
  String? prodEtaToken;
  DateTime? prodEtaTokenExpiry;
  int activeEnvironment;
  int? invoiceVersion;
  String? tokenLabel;
  String? tokenSerial;
  String? certificateSerial;
  String? certificateIssuerName;
  String? tokenPin;
  DateTime? tokenExpiry;
  int? activeEnvironmentReceipt;
  int? receiptVersion;
  String? preprodClientIdReceipt;
  String? preprodClientSecretReceipt;
  DateTime? preprodExpiryDateReceipt;
  String? preprodPosSerialReceipt;
  String? prodClientIdReceipt;
  String? prodClientSecretReceipt;
  DateTime? prodExpiryDateReceipt;
  String? preprodEtaTokenReceipt;
  DateTime? preprodEtaTokenExpiryReceipt;
  String? prodPosSerialReceipt;
  String? prodEtaTokenReceipt;
  DateTime? prodEtaTokenExpiryReceipt;

  CompanyETAConnectionModel({
     this.tokenDownloadUrl,
     this.invoiceTemplateUrl,
     this.invoiceDataUrl,
    required this.id,
    required this.companyId,
     this.preprodClientId,
     this.preprodClientSecret,
     this.preprodExpiryDate,
     this.prodClientId,
     this.prodClientSecret,
     this.prodExpiryDate,
     this.preprodEtaToken,
     this.preprodEtaTokenExpiry,
     this.prodEtaToken,
     this.prodEtaTokenExpiry,
    required this.activeEnvironment,
     this.invoiceVersion,
     this.tokenLabel,
     this.tokenSerial,
     this.certificateSerial,
     this.certificateIssuerName,
     this.tokenPin,
     this.tokenExpiry,
     this.activeEnvironmentReceipt,
     this.receiptVersion,
     this.preprodClientIdReceipt,
     this.preprodClientSecretReceipt,
     this.preprodExpiryDateReceipt,
     this.preprodPosSerialReceipt,
     this.prodClientIdReceipt,
     this.prodClientSecretReceipt,
     this.prodExpiryDateReceipt,
     this.preprodEtaTokenReceipt,
     this.preprodEtaTokenExpiryReceipt,
     this.prodPosSerialReceipt,
     this.prodEtaTokenReceipt,
     this.prodEtaTokenExpiryReceipt,
  });

  factory CompanyETAConnectionModel.fromJson(Map<String, dynamic> json) => CompanyETAConnectionModel(
    tokenDownloadUrl: json["tokenDownloadURL"],
    invoiceTemplateUrl: json["invoiceTemplateURL"],
    invoiceDataUrl: json["invoiceDataURL"],
    id: json["id"],
    companyId: json["companyId"],
    preprodClientId: json["preprodClientId"],
    preprodClientSecret: json["preprodClientSecret"],
    preprodExpiryDate: DateTime.parse(json["preprodExpiryDate"]),
    prodClientId: json["prodClientId"],
    prodClientSecret: json["prodClientSecret"],
    prodExpiryDate: DateTime.parse(json["prodExpiryDate"]),
    preprodEtaToken: json["preprodEtaToken"],
    preprodEtaTokenExpiry: DateTime.parse(json["preprodEtaTokenExpiry"]),
    prodEtaToken: json["prodEtaToken"],
    prodEtaTokenExpiry: DateTime.parse(json["prodEtaTokenExpiry"]),
    activeEnvironment: json["activeEnvironment"],
    invoiceVersion: json["invoiceVersion"],
    tokenLabel: json["tokenLabel"],
    tokenSerial: json["tokenSerial"],
    certificateSerial: json["certificateSerial"],
    certificateIssuerName: json["certificateIssuerName"],
    tokenPin: json["tokenPin"],
    tokenExpiry: DateTime.parse(json["tokenExpiry"]),
    activeEnvironmentReceipt: json["activeEnvironment_Receipt"],
    receiptVersion: json["receiptVersion"],
    preprodClientIdReceipt: json["preprodClientId_Receipt"],
    preprodClientSecretReceipt: json["preprodClientSecret_Receipt"],
    preprodExpiryDateReceipt: DateTime.parse(json["preprodExpiryDate_Receipt"]),
    preprodPosSerialReceipt: json["preprodPosSerial_Receipt"],
    prodClientIdReceipt: json["prodClientId_Receipt"],
    prodClientSecretReceipt: json["prodClientSecret_Receipt"],
    prodExpiryDateReceipt: DateTime.parse(json["prodExpiryDate_Receipt"]),
    preprodEtaTokenReceipt: json["preprodEtaToken_Receipt"],
    preprodEtaTokenExpiryReceipt: DateTime.parse(json["preprodEtaTokenExpiry_Receipt"]),
    prodPosSerialReceipt: json["prodPosSerial_Receipt"],
    prodEtaTokenReceipt: json["prodEtaToken_Receipt"],
    prodEtaTokenExpiryReceipt: DateTime.parse(json["prodEtaTokenExpiry_Receipt"]),
  );

  Map<String, dynamic> toJson() => {
    "tokenDownloadURL": tokenDownloadUrl,
    "invoiceTemplateURL": invoiceTemplateUrl,
    "invoiceDataURL": invoiceDataUrl,
    "id": id,
    "companyId": companyId,
    "preprodClientId": preprodClientId,
    "preprodClientSecret": preprodClientSecret,
    "preprodExpiryDate": preprodExpiryDate?.toIso8601String(),
    "prodClientId": prodClientId,
    "prodClientSecret": prodClientSecret,
    "prodExpiryDate": prodExpiryDate?.toIso8601String(),
    "preprodEtaToken": preprodEtaToken,
    "preprodEtaTokenExpiry": preprodEtaTokenExpiry?.toIso8601String(),
    "prodEtaToken": prodEtaToken,
    "prodEtaTokenExpiry": prodEtaTokenExpiry?.toIso8601String(),
    "activeEnvironment": activeEnvironment,
    "invoiceVersion": invoiceVersion,
    "tokenLabel": tokenLabel,
    "tokenSerial": tokenSerial,
    "certificateSerial": certificateSerial,
    "certificateIssuerName": certificateIssuerName,
    "tokenPin": tokenPin,
    "tokenExpiry": tokenExpiry?.toIso8601String(),
    "activeEnvironment_Receipt": activeEnvironmentReceipt,
    "receiptVersion": receiptVersion,
    "preprodClientId_Receipt": preprodClientIdReceipt,
    "preprodClientSecret_Receipt": preprodClientSecretReceipt,
    "preprodExpiryDate_Receipt": preprodExpiryDateReceipt?.toIso8601String(),
    "preprodPosSerial_Receipt": preprodPosSerialReceipt,
    "prodClientId_Receipt": prodClientIdReceipt,
    "prodClientSecret_Receipt": prodClientSecretReceipt,
    "prodExpiryDate_Receipt": prodExpiryDateReceipt?.toIso8601String(),
    "preprodEtaToken_Receipt": preprodEtaTokenReceipt,
    "preprodEtaTokenExpiry_Receipt": preprodEtaTokenExpiryReceipt?.toIso8601String(),
    "prodPosSerial_Receipt": prodPosSerialReceipt,
    "prodEtaToken_Receipt": prodEtaTokenReceipt,
    "prodEtaTokenExpiry_Receipt": prodEtaTokenExpiryReceipt?.toIso8601String(),
  };
}
