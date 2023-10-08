import 'package:json_annotation/json_annotation.dart';
import 'line_tax.dart';
import 'line_total.dart';
part 'invoice_line.g.dart';

@JsonSerializable()
class Line {
  Line({
    required this.itemId,
    required this.unitType,
    required this.quantity,
    required this.currencyId,
    required this.priceEgp,
    this.id,
    this.invoiceId,
    this.priceSold,
    this.valueDifference,
    this.itemDiscount,
    this.totalTaxableFees,
    this.salesTotal,
    this.netTotal,
    this.taxTotal,
    this.total,
    this.addedDate,
    this.addedBy,
    this.updatedDate,
    this.updatedBy,
    this.removed,
    this.removedDate,
    this.removedBy,
    this.lineTax,
    this.lineTotal,
    required this.itemDescription,
    this.exchangeRate,
    this.discountRate,
    this.discountAmount,
  });

  late int itemId;
  late int unitType;
  late num quantity;
  late int currencyId;
  late num priceEgp;
  int? id;
  int? invoiceId;
  num? priceSold;
  num? valueDifference;
  num? itemDiscount;
  num? totalTaxableFees;
  num? salesTotal;
  num? netTotal;
  num? taxTotal;
  num? total;
  DateTime? addedDate;
  int? addedBy;
  DateTime? updatedDate;
  DateTime? updatedBy;
  bool? removed;
  DateTime? removedDate;
  int? removedBy;
  List<LineTax>? lineTax = [];
  LineTotal? lineTotal;
  String? itemDescription;
  num? exchangeRate;
  num? discountRate;
  num? discountAmount;

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "unitType": unitType,
        "quantity": quantity,
        "currencyId": currencyId,
        "priceEgp": priceEgp,
        "id": id,
        "invoiceId": invoiceId,
        "priceSold": priceSold,
        "valueDifference": valueDifference,
        "itemDiscount": itemDiscount,
        "totalTaxableFees": totalTaxableFees,
        "salesTotal": salesTotal,
        "netTotal": netTotal,
        "taxTotal": taxTotal,
        "total": total,
        "addedDate": addedDate?.toIso8601String(),
        "addedBy": addedBy,
        "updatedDate": updatedDate?.toIso8601String(),
        "updatedBy": updatedBy?.toIso8601String(),
        "removed": removed,
        "removedDate": removedDate?.toIso8601String(),
        "removedBy": removedBy,
        "LineTax": lineTax?.map((e) => e.toJson()).toList() ?? [],
        "LineTotal": lineTotal?.toJson(),
        "itemDescription": itemDescription,
        "exchangeRate": exchangeRate,
        "discountRate": discountRate,
        "discountAmount": discountAmount,
      };

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
