import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../../../modules/checkout/model/address.dart';

abstract class CheckOutRepository {
  abstract final RxInt totalPrice;
  abstract final RxInt totalQuantity;
  abstract final Rx<Address?> address;
  abstract RxList<CartComponentModel?> cartComponentCardList;
  Future<CartResponse> updateProduct(String productId, int quantity);
  Future<CartResponse> deleteProduct(String productId);
  Future<CartResponse> getCart();
  Address? setShippingAddress(Address address);
}
