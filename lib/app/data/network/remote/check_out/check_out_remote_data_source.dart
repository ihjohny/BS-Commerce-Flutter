import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';

abstract class CheckOutRemoteDataSource {
  Future<CartResponse>addToCart(String productId, int quantity);
  Future<CartResponse> getCart();
  Future<CartResponse> updateProduct(String productId, int quantity);
  Future<CartResponse> deleteProduct(String productId);
}
