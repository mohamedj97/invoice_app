import 'package:invoice_app/features/products/domain/entities/product.dart';
import 'list_meta_data.dart';
import 'meta.dart';

class ProductsResultResponse{
  late List<Product> items=[];
  late ListMetaData listMetadata;
  List<Meta>? meta;

  ProductsResultResponse({required this.items,required this.listMetadata, this.meta});

  @override
  List<Object?> get props => [items, listMetadata, meta];
}