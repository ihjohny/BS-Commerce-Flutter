import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';

import '../../model/check_out/order_payload.dart';
import '../../model/check_out/order_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> addToCart(String productId, int quantity);
  Future<CartResponse> getCart();
  Future<CartResponse> updateProduct(String productId, int quantity);
  Future<CartResponse> deleteProduct(String productId);
  Future<OrderSuccessResponse> placeOrder(OrderPayload orderPayload);
  Future<bool> clearCart();
}
