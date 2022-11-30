import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'meta_data.dart';

class CustomerResultResponse extends Equatable {
 late List<CustomerModel> result=[];
  int? total;
  late List<MetaData> metData=[];

  CustomerResultResponse({required this.result, this.total,required this.metData});

  @override
  List<Object?> get props => [result, total, metData];
}
