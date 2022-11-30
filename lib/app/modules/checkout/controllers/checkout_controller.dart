import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/network/repository/cart/cart_repository.dart';
import '../../../data/network/repository/check_out/checkout_repository.dart';
import '../model/address.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/CheckOut/model/ui_data.dart';

class CheckOutController extends BaseController {
  final CheckOutRepository _repository =
      Get.find<CheckOutRepository>(tag: (CheckOutRepository).toString());

  final CartRepository cartRepository =
      Get.find(tag: (CartRepository).toString());

  final Rx<UiData?> _data = Rx(null);
  final RxBool isExpanded = RxBool(true);
  Rx<Address?>? address;

  @override
  void onInit() {
    debugPrint("MY Repo" + _repository.hashCode.toString());
    address = _repository.address;
    super.onInit();
  }

  UiData? get data => _data.value;

  getCart() {
    callDataService(cartRepository.getCart());
  }

  setAddress(Address address) {
    debugPrint(_repository.setShippingAddress(address).toString());
  }

// _handleDataResponse(ProductCheckOutResponse data) {
//   _data(UiData(data));
// }
}
