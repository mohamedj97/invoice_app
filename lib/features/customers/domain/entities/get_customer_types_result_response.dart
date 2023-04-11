import 'package:invoice_app/features/company_registration/domain/entities/governate_lookup.dart';
import 'package:invoice_app/features/products/domain/entities/base_lookup.dart';
import '../../../invoices/domain/entities/item_lookup.dart';
import '../../../invoices/domain/entities/lookup_code.dart';
import '../../../invoices/domain/entities/tax_subtype_lookup.dart';
import '../../../products/domain/entities/meta.dart';

class CustomerTypesResultResponse {
  late List<Meta> metaData = [];
  late List<BaseLookup> customerType = [];
  late List<LookupCode> countries = [];
  late List<LookupCode> currencies = [];
  late List<LookupCode> taxTypes = [];
  late List<BaseLookup> shipTypes = [];
  late List<GovernateLookup> governates = [];
  late List<ItemLookup> items = [];
  late List<TaxSubtypeLookup> taxSubTypes = [];

  CustomerTypesResultResponse({
    required this.metaData,
    required this.customerType,
    required this.countries,
    required this.currencies,
    required this.taxTypes,
    required this.shipTypes,
    required this.governates,
    required this.items,
    required this.taxSubTypes,
  });

  @override
  List<Object> get props => [
    metaData,
    customerType,
    countries,
    currencies,
    taxTypes,
    shipTypes,
    governates,
    items,
    taxSubTypes,
  ];
}
