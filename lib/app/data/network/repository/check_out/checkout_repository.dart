import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../../../modules/checkout/model/address.dart';

abstract class CheckOutRepository {
  abstract final Rx<Address?> address;
  abstract RxList<CartComponentModel?> cartComponentCardList;
  Address? setShippingAddress(Address address);
}
