// To parse this JSON data, do
//
//     final getLookupsResults = getLookupsResultsFromJson(jsonString);

import 'dart:convert';

GetLookupsResults getLookupsResultsFromJson(String str) => GetLookupsResults.fromJson(json.decode(str));

String getLookupsResultsToJson(GetLookupsResults data) => json.encode(data.toJson());

class GetLookupsResults {
  Result? result;
  int? status;
  int? statuscode;
  List<String>? message;

  GetLookupsResults({
     this.result,
     this.status,
     this.statuscode,
     this.message,
  });

  factory GetLookupsResults.fromJson(Map<String, dynamic> json) => GetLookupsResults(
    result: Result.fromJson(json["result"]),
    status: json["status"],
    statuscode: json["statuscode"],
    message: List<String>.from(json["message"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "status": status,
    "statuscode": statuscode,
    "message": List<dynamic>.from(message!.map((x) => x)),
  };
}

class Result {
  List<BusinessActivity> businessActivity;
  List<BusinessActivity> countries;
  List<Governate> governates;
  List<BusinessActivity> etaEnvironment;
  List<BusinessActivity> invoiceVersion;
  List<MetaDatum> metaData;

  Result({
    required this.businessActivity,
    required this.countries,
    required this.governates,
    required this.etaEnvironment,
    required this.invoiceVersion,
    required this.metaData,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    businessActivity: List<BusinessActivity>.from(json["businessActivity"].map((x) => BusinessActivity.fromJson(x))),
    countries: List<BusinessActivity>.from(json["countries"].map((x) => BusinessActivity.fromJson(x))),
    governates: List<Governate>.from(json["governates"].map((x) => Governate.fromJson(x))),
    etaEnvironment: List<BusinessActivity>.from(json["etaEnvironment"].map((x) => BusinessActivity.fromJson(x))),
    invoiceVersion: List<BusinessActivity>.from(json["invoiceVersion"].map((x) => BusinessActivity.fromJson(x))),
    metaData: List<MetaDatum>.from(json["metaData"].map((x) => MetaDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "businessActivity": List<dynamic>.from(businessActivity.map((x) => x.toJson())),
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "governates": List<dynamic>.from(governates.map((x) => x.toJson())),
    "etaEnvironment": List<dynamic>.from(etaEnvironment.map((x) => x.toJson())),
    "invoiceVersion": List<dynamic>.from(invoiceVersion.map((x) => x.toJson())),
    "metaData": List<dynamic>.from(metaData.map((x) => x.toJson())),
  };
}

class BusinessActivity {
  int id;
  String name;

  BusinessActivity({
    required this.id,
    required this.name,
  });

  factory BusinessActivity.fromJson(Map<String, dynamic> json) => BusinessActivity(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Governate {
  int countryId;
  int id;
  String name;

  Governate({
    required this.countryId,
    required this.id,
    required this.name,
  });

  factory Governate.fromJson(Map<String, dynamic> json) => Governate(
    countryId: json["countryId"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "id": id,
    "name": name,
  };
}

class MetaDatum {
  String field;
  String label;

  MetaDatum({
    required this.field,
    required this.label,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    field: json["field"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "label": label,
  };
}
