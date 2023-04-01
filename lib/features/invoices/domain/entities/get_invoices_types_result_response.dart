import '../../../products/domain/entities/meta.dart';
import 'invoice_lookup_result.dart';

class InvoiceTypesResultResponse {
  InvoiceLookUpResult result;

  InvoiceTypesResultResponse({
    required this.result,
  });

  @override
  List<Object?> get props => [
    result,
  ];
}
