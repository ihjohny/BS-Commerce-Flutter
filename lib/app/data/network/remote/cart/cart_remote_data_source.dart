import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';

abstract class CartRemoteDataSource {
  Future addToCart(String productId, int quantity);
  Future<CartResponse> getCart();

}
