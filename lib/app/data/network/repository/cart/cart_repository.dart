import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';

abstract class CartRepository {
  abstract final RxInt totalPrice;
  abstract final RxInt totalQuantity;
  abstract RxList<CartComponentModel?> cartComponentCardList;
  Future<CartResponse> addToCart(String productId, int quantity);
  Future<CartResponse> getCart();
}
