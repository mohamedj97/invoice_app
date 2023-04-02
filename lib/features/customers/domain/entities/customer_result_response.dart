import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/domain/entities/meta_data_model.dart';
import '../../../products/domain/entities/list_meta_data.dart';

class CustomerResultResponse {
  late List<CustomerModel> customers = [];
  late ListMetaData listMetadata;
  late List<MetaDataModel> metaData = [];

  CustomerResultResponse({required this.customers, required this.listMetadata, required this.metaData});

  @override
  List<Object?> get props => [customers, listMetadata, metaData];
}
