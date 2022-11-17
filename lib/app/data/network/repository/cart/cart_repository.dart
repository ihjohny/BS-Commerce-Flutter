import '../../../../modules/product_details/model/add_to_cart_response.dart';
import '../../model/product_details/response.dart';

abstract class CartRepository {
  Future addToCart(String productId, int quantity);
  Future getCart();
}
