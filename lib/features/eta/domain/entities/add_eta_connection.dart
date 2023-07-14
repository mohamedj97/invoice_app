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
  int? activeEnvironment;
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

  AddETAModel({
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
     this.activeEnvironment,
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

  factory AddETAModel.fromJson(Map<String, dynamic> json) => AddETAModel(
    id: json["id"],
    companyId: json["companyId"],
    preprodClientId: json["preprodClientId"],
    preprodClientSecret: json["preprodClientSecret"],
    preprodExpiryDate: json["preprodExpiryDate"]==null ?null:DateTime.parse(json["preprodExpiryDate"]as String),
    prodClientId: json["prodClientId"],
    prodClientSecret: json["prodClientSecret"],
    prodExpiryDate: json["prodExpiryDate"]==null ?null:DateTime.parse(json["prodExpiryDate"]as String),
    preprodEtaToken: json["preprodEtaToken"],
    preprodEtaTokenExpiry: json["preprodEtaTokenExpiry"]==null ?null:DateTime.parse(json["preprodEtaTokenExpiry"]as String),
    prodEtaToken: json["prodEtaToken"],
    prodEtaTokenExpiry: json["prodEtaTokenExpiry"]==null ?null:DateTime.parse(json["prodEtaTokenExpiry"]as String),
    activeEnvironment: json["activeEnvironment"],
    invoiceVersion: json["invoiceVersion"],
    tokenLabel: json["tokenLabel"],
    tokenSerial: json["tokenSerial"],
    certificateSerial: json["certificateSerial"],
    certificateIssuerName: json["certificateIssuerName"],
    tokenPin: json["tokenPin"],
    tokenExpiry: json["tokenExpiry"]==null ?null:DateTime.parse(json["tokenExpiry"]as String),
    activeEnvironmentReceipt: json["activeEnvironment_Receipt"],
    receiptVersion: json["receiptVersion"],
    preprodClientIdReceipt: json["preprodClientId_Receipt"],
    preprodClientSecretReceipt: json["preprodClientSecret_Receipt"],
    preprodExpiryDateReceipt: json["preprodExpiryDateReceipt"]==null ?null:DateTime.parse(json["preprodExpiryDateReceipt"]as String),
    preprodPosSerialReceipt: json["preprodPosSerial_Receipt"],
    prodClientIdReceipt: json["prodClientId_Receipt"],
    prodClientSecretReceipt: json["prodClientSecret_Receipt"],
    prodExpiryDateReceipt: json["prodExpiryDateReceipt"]==null ?null:DateTime.parse(json["prodExpiryDateReceipt"]as String),
    preprodEtaTokenReceipt: json["preprodEtaToken_Receipt"],
    preprodEtaTokenExpiryReceipt: json["preprodEtaTokenExpiryReceipt"]==null ?null:DateTime.parse(json["preprodEtaTokenExpiryReceipt"]as String),
    prodPosSerialReceipt: json["prodPosSerial_Receipt"],
    prodEtaTokenReceipt: json["prodEtaToken_Receipt"],
    prodEtaTokenExpiryReceipt: json["prodEtaTokenExpiryReceipt"]==null ?null:DateTime.parse(json["prodEtaTokenExpiryReceipt"]as String),
  );

  Map<String, dynamic> toJson() => {
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
