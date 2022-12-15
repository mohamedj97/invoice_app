import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/product_request_model.dart';
import '../data/models/responses/add_product_response_model.dart';
import '../data/models/responses/get_products_response_model.dart';

part 'products_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ProductsClient {
  factory ProductsClient(Dio dio, {String baseUrl}) = _ProductsClient;

  @GET(EndPoints.getProducts)
  Future<GetProductsResponse> getProducts();

  @POST(EndPoints.addProduct)
  Future<AddProductResponse> addProduct(@Body() ProductModel productModel);
}
