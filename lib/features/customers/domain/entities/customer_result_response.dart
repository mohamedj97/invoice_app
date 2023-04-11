import 'package:invoice_app/features/customers/domain/entities/meta_data_model.dart';
import '../../../products/domain/entities/list_meta_data.dart';
import 'customers_model.dart';

class CustomerResultResponse {
  late List<CustomersModel> customers = [];
  late ListMetaData listMetadata;
  late List<MetaDataModel> metaData = [];

  CustomerResultResponse({required this.customers, required this.listMetadata, required this.metaData});

  @override
  List<Object?> get props => [customers, listMetadata, metaData];
}
