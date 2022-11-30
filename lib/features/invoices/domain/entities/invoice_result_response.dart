import '../../../customers/domain/entities/meta_data.dart';
import 'invoice_head_model.dart';

class InvoiceResultResponse {
  late List<InvoiceHeadModel> result=[];
  int? total;
   List<MetaData>? metData;

  InvoiceResultResponse({required this.result, this.total, this.metData});

  @override
  List<Object?> get props => [result, total, metData];
}
