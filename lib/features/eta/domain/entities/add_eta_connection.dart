// To parse this JSON data, do
//
//     final addEtaConnectionResult = addEtaConnectionResultFromJson(jsonString);

import 'dart:convert';

AddEtaConnectionResult addEtaConnectionResultFromJson(String str) => AddEtaConnectionResult.fromJson(json.decode(str));

String addEtaConnectionResultToJson(AddEtaConnectionResult data) => json.encode(data.toJson());

class AddEtaConnectionResult {
  AddETAModel? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  AddEtaConnectionResult({
     this.result,
     this.status,
     this.statuscode,
     this.message,
     this.exception,
  });

  factory AddEtaConnectionResult.fromJson(Map<String, dynamic> json) => AddEtaConnectionResult(
    result: AddETAModel.fromJson(json["result"]),
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

class AddETAModel {
  int id;
  int companyId;
  String preprodClientId;
  String preprodClientSecret;
  DateTime preprodExpiryDate;
  String prodClientId;
  String prodClientSecret;
  DateTime prodExpiryDate;
  String preprodEtaToken;
  DateTime preprodEtaTokenExpiry;
  String prodEtaToken;
  DateTime prodEtaTokenExpiry;
  int activeEnvironment;
  int invoiceVersion;
  String tokenLabel;
  String tokenSerial;
  String certificateSerial;
  String certificateIssuerName;
  String tokenPin;
  DateTime tokenExpiry;
  int activeEnvironmentReceipt;
  int receiptVersion;
  String preprodClientIdReceipt;
  String preprodClientSecretReceipt;
  DateTime preprodExpiryDateReceipt;
  String preprodPosSerialReceipt;
  String prodClientIdReceipt;
  String prodClientSecretReceipt;
  DateTime prodExpiryDateReceipt;
  String preprodEtaTokenReceipt;
  DateTime preprodEtaTokenExpiryReceipt;
  String prodPosSerialReceipt;
  String prodEtaTokenReceipt;
  DateTime prodEtaTokenExpiryReceipt;

  AddETAModel({
    required this.id,
    required this.companyId,
    required this.preprodClientId,
    required this.preprodClientSecret,
    required this.preprodExpiryDate,
    required this.prodClientId,
    required this.prodClientSecret,
    required this.prodExpiryDate,
    required this.preprodEtaToken,
    required this.preprodEtaTokenExpiry,
    required this.prodEtaToken,
    required this.prodEtaTokenExpiry,
    required this.activeEnvironment,
    required this.invoiceVersion,
    required this.tokenLabel,
    required this.tokenSerial,
    required this.certificateSerial,
    required this.certificateIssuerName,
    required this.tokenPin,
    required this.tokenExpiry,
    required this.activeEnvironmentReceipt,
    required this.receiptVersion,
    required this.preprodClientIdReceipt,
    required this.preprodClientSecretReceipt,
    required this.preprodExpiryDateReceipt,
    required this.preprodPosSerialReceipt,
    required this.prodClientIdReceipt,
    required this.prodClientSecretReceipt,
    required this.prodExpiryDateReceipt,
    required this.preprodEtaTokenReceipt,
    required this.preprodEtaTokenExpiryReceipt,
    required this.prodPosSerialReceipt,
    required this.prodEtaTokenReceipt,
    required this.prodEtaTokenExpiryReceipt,
  });

  factory AddETAModel.fromJson(Map<String, dynamic> json) => AddETAModel(
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
    "id": id,
    "companyId": companyId,
    "preprodClientId": preprodClientId,
    "preprodClientSecret": preprodClientSecret,
    "preprodExpiryDate": preprodExpiryDate.toIso8601String(),
    "prodClientId": prodClientId,
    "prodClientSecret": prodClientSecret,
    "prodExpiryDate": prodExpiryDate.toIso8601String(),
    "preprodEtaToken": preprodEtaToken,
    "preprodEtaTokenExpiry": preprodEtaTokenExpiry.toIso8601String(),
    "prodEtaToken": prodEtaToken,
    "prodEtaTokenExpiry": prodEtaTokenExpiry.toIso8601String(),
    "activeEnvironment": activeEnvironment,
    "invoiceVersion": invoiceVersion,
    "tokenLabel": tokenLabel,
    "tokenSerial": tokenSerial,
    "certificateSerial": certificateSerial,
    "certificateIssuerName": certificateIssuerName,
    "tokenPin": tokenPin,
    "tokenExpiry": tokenExpiry.toIso8601String(),
    "activeEnvironment_Receipt": activeEnvironmentReceipt,
    "receiptVersion": receiptVersion,
    "preprodClientId_Receipt": preprodClientIdReceipt,
    "preprodClientSecret_Receipt": preprodClientSecretReceipt,
    "preprodExpiryDate_Receipt": preprodExpiryDateReceipt.toIso8601String(),
    "preprodPosSerial_Receipt": preprodPosSerialReceipt,
    "prodClientId_Receipt": prodClientIdReceipt,
    "prodClientSecret_Receipt": prodClientSecretReceipt,
    "prodExpiryDate_Receipt": prodExpiryDateReceipt.toIso8601String(),
    "preprodEtaToken_Receipt": preprodEtaTokenReceipt,
    "preprodEtaTokenExpiry_Receipt": preprodEtaTokenExpiryReceipt.toIso8601String(),
    "prodPosSerial_Receipt": prodPosSerialReceipt,
    "prodEtaToken_Receipt": prodEtaTokenReceipt,
    "prodEtaTokenExpiry_Receipt": prodEtaTokenExpiryReceipt.toIso8601String(),
  };
}
