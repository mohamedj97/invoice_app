import 'package:invoice_app/features/invoices/domain/entities/meta_data.dart';
import '../../../products/domain/entities/list_meta_data.dart';
import 'invoice_head_model.dart';

class InvoiceResultResponse {
  late List<InvoiceHeadModel> result=[];
  late ListMetaData listMetadata;
   late List<MetaDataData> metaData=[];

  InvoiceResultResponse({required this.result,required this.listMetadata,required this.metaData});

  @override
  List<Object?> get props => [result, listMetadata, metaData];
}
