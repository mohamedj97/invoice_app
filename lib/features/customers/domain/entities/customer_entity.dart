import 'package:invoice_app/features/customers/domain/entities/customer_contact_person.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_ship_address.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_entity.g.dart';
@JsonSerializable()
class CustomerModel{
  late int Id;

  late int CompanyId;
  String? Code;

  String? Name;

  num? IdentityId;

  int? CountryId;

  String? CountryName;

  String? CountryNamear;

  String? CountryCode;

  int? GovernateId;

  String? GovernateName;

  String? GovernateNamear;

  String? City;

  String? Street;

  String? BuilldingNumber;

  String? PostalCode;

  String? Floor;

  String? Room;

  String? Landmark;

  String? AdditionalInformation;

  String? Address;

  String? Address2;

  int TypeId;

  String? TypeCode;

  String? TypeName;

  bool Active;

  String? Mobile;

  String? Tel;

  String? Fax;

  String? Email;

  String? Website;

  int CurrencyId;

  String? CurrencyCode;

  String? CurrencyName;

  String? CurrencyNamear;

  int mobile;

  String? ItemCode;

  String? ItemName;

  int TaxTypeId;

  String? TaxTypeCode;

  String? TaxTypeName;

  String? TaxTypeNamear;

  int TaxTypeSubId;

  String? TaxTypeSubCode;

  String?   TaxTypeSubName;

  String? TaxTypeSubNamear;

  num TaxRate;

  List<CustomerContactPerson>? ContactPersons;
  List<CustomerShipAddress>? ShipAddresses;

  CustomerModel(
      {required this.Id,
        required this.CompanyId,
        this.Code,
        this.Name,
        this.IdentityId,
        this.CountryId,
        this.CountryName,
        this.CountryNamear,
        this.CountryCode,
        this.GovernateId,
        this.GovernateName,
        this.GovernateNamear,
        this.City,
        this.Street,
        this.BuilldingNumber,
        this.PostalCode,
        this.Floor,
        this.Room,
        this.Landmark,
        this.AdditionalInformation,
        this.Address,
        this.Address2,
        required this.TypeId,
        this.TypeCode,
        this.TypeName,
        required this.Active,
        this.Mobile,
        this.Tel,
        this.Fax,
        this.Email,
        this.Website,
        required this.CurrencyId,
        this.CurrencyCode,
        this.CurrencyName,
        this.CurrencyNamear,
        required this.mobile,
        this.ItemCode,
        this.ItemName,
        required this.TaxTypeId,
        this.TaxTypeCode,
        this.TaxTypeName,
        this.TaxTypeNamear,
        required this.TaxTypeSubId,
        this.TaxTypeSubCode,
        this.TaxTypeSubName,
        this.TaxTypeSubNamear,
        required this.TaxRate,
        this.ContactPersons,
        this.ShipAddresses});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
