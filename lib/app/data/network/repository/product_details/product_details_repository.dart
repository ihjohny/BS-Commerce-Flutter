import '../../model/product_details/response.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsResponse> getProductDetails(String productId);
}
