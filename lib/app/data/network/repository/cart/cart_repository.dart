import 'package:bs_commerce/app/data/network/model/check_out/check_out_address.dart';
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../../../modules/checkout/model/payment.dart';
import '../../model/check_out/order_payload.dart';
import '../../model/check_out/order_response.dart';

abstract class CartRepository {
  abstract final RxInt totalPrice;
  abstract final RxInt totalQuantity;
  abstract RxList<CartComponentModel?> cartComponentCardList;
  Future<CartResponse> addToCart(String productId, int quantity);
  Future<CartResponse> updateProduct(String productId, int quantity);
  Future<CartResponse> deleteProduct(String productId);
  Future<CartResponse> getCart();
  abstract final Rx<CheckOutAddress?> address;
  CheckOutAddress? setShippingAddress(CheckOutAddress address);
  Future<OrderSuccessResponse?> placeOrder(OrderPayload orderPayload);
  Future<List<PaymentOption>> getPaymentMethodList();
  clearCart();
}
