import 'package:invoice_app/features/invoices/domain/entities/meta_data.dart';

import 'invoice_head_model.dart';

class InvoiceResultResponse {
  late List<InvoiceHeadModel> result=[];
  int? total;
   late List<MetaDataData> metaData=[];

  InvoiceResultResponse({required this.result, this.total,required this.metaData});

  @override
  List<Object?> get props => [result, total, metaData];
}
