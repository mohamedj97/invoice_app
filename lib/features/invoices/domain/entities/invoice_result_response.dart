import 'package:invoice_app/features/invoices/domain/entities/meta_data.dart';
import '../../../products/domain/entities/list_meta_data.dart';
import 'invoice_head_model.dart';

class InvoiceResultResponse {
  late List<InvoiceHeadModel> invoices = [];
  late ListMetaData listMetadata;
  late bool signingRequired;
  late List<MetaDataData> metaData = [];

  InvoiceResultResponse({
    required this.invoices,
    required this.listMetadata,
    required this.metaData,
    required this.signingRequired,
  });

  @override
  List<Object?> get props => [invoices, listMetadata, metaData,signingRequired];
}
