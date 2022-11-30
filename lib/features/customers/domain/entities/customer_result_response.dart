import 'package:equatable/equatable.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/domain/entities/meta_data_model.dart';

class CustomerResultResponse extends Equatable {
 late List<CustomerModel> result=[];
  int? total;
  late List<MetaDataModel> metData=[];

  CustomerResultResponse({required this.result, this.total,required this.metData});

  @override
  List<Object?> get props => [result, total, metData];
}
