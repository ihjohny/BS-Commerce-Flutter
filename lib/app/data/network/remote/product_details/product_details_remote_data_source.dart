import '../../model/product_details/response.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsResponse> getProductDetails(String productId);
}
