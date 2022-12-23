import '../../../products/domain/entities/meta.dart';
import 'invoice_lookup_result.dart';

class InvoiceTypesResultResponse {
  InvoiceLookUpResult result;
  int? total;
  late List<Meta> metaData = [];

  InvoiceTypesResultResponse({
    required this.result,
    this.total,
    required this.metaData,
  });

  @override
  List<Object?> get props => [
    result,
    total,
    metaData,
  ];
}
