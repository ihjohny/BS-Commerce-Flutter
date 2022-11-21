import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';

import '../../model/product_details/response.dart';

abstract class CartRepository {
  Future addToCart(String productId, int quantity);
  Future<CartResponse> getCart();
}
