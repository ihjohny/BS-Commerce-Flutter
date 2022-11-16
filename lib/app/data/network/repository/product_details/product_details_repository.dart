import '../../../../modules/product_details/model/add_to_cart_response.dart';
import '../../model/product_details/response.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsResponse> getProductDetails(String productId);

  Future addToCart(String productId, int quantity);
}
