import 'package:bs_commerce/app/data/network/model/check_out/order_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../../../modules/checkout/model/address.dart';
import '../../model/check_out/order_payload.dart';

abstract class CheckOutRepository {
  abstract final Rx<Address?> address;
  abstract RxList<CartComponentModel?> cartComponentCardList;

  Address? setShippingAddress(Address address);

  Future<OrderResponse?> placeOrder(OrderPayLoad orderPayload);
}
