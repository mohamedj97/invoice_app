import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/get_products_request_model.dart';
import '../data/models/requests/product_request_model.dart';
import '../data/models/responses/add_product_response_model.dart';
import '../data/models/responses/get_item_types_response_model.dart';
import '../data/models/responses/get_products_response_model.dart';

part 'products_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ProductsClient {
  factory ProductsClient(Dio dio, {String baseUrl}) = _ProductsClient;

  @POST(EndPoints.getProducts)
  Future<GetProductsResponse> getProducts(@Body() ProductFilterGenericFilterModel productFilterGenericFilterModel);

  @POST(EndPoints.addProduct)
  Future<AddProductResponse> addProduct(@Body() ProductModel productModel);

  @GET(EndPoints.getItemTypes)
  Future<GetItemTypesResponse> getItemTypes();

  @PUT(EndPoints.editProduct)
  Future<StringResponse> editProduct(int id,@Body() ProductModel productModel);
}
