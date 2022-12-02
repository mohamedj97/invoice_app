import 'package:invoice_app/features/products/domain/entities/product.dart';
import 'meta.dart';

class ProductsResultResponse{
  late List<Product> result=[];
  int? total;
  late List<Meta> meta=[];

  ProductsResultResponse({required this.result, this.total,required this.meta});

  @override
  List<Object?> get props => [result, total, meta];
}