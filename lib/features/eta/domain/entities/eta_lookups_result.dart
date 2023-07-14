// To parse this JSON data, do
//
//     final etaConnectionLookupsResult = etaConnectionLookupsResultFromJson(jsonString);

import 'dart:convert';

EtaConnectionLookupsResult etaConnectionLookupsResultFromJson(String str) => EtaConnectionLookupsResult.fromJson(json.decode(str));

String etaConnectionLookupsResultToJson(EtaConnectionLookupsResult data) => json.encode(data.toJson());

class EtaConnectionLookupsResult {
  Result? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  EtaConnectionLookupsResult({
     this.result,
     this.status,
     this.statuscode,
     this.message,
     this.exception,
  });

  factory EtaConnectionLookupsResult.fromJson(Map<String, dynamic> json) => EtaConnectionLookupsResult(
    result: Result.fromJson(json["result"]),
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

class Result {
  List<EtaEnvironment> etaEnvironments;
  List<EtaEnvironment> invoiceVersions;

  Result({
    required this.etaEnvironments,
    required this.invoiceVersions,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    etaEnvironments: List<EtaEnvironment>.from(json["etaEnvironments"].map((x) => EtaEnvironment.fromJson(x))),
    invoiceVersions: List<EtaEnvironment>.from(json["invoiceVersions"].map((x) => EtaEnvironment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "etaEnvironments": List<dynamic>.from(etaEnvironments.map((x) => x.toJson())),
    "invoiceVersions": List<dynamic>.from(invoiceVersions.map((x) => x.toJson())),
  };
}

class EtaEnvironment {
  int id;
  String name;

  EtaEnvironment({
    required this.id,
    required this.name,
  });

  factory EtaEnvironment.fromJson(Map<String, dynamic> json) => EtaEnvironment(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
