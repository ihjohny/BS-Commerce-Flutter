import 'package:get/get.dart';

import '../../../data/network/repository/cart/cart_repository.dart';
import '../../../data/network/repository/check_out/checkout_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/CheckOut/model/ui_data.dart';

class CheckOutController extends BaseController {
  final CheckOutRepository _repository = Get.find(tag: (CheckOutRepository).toString());
  final CartRepository cartRepository =
      Get.find(tag: (CartRepository).toString());
  final Rx<UiData?> _data = Rx(null);
  final RxBool haveAddress = RxBool(false);

  UiData? get data => _data.value;
  getCart() {
    callDataService(cartRepository.getCart());
  }

  // _handleDataResponse(ProductCheckOutResponse data) {
  //   _data(UiData(data));
  // }
}
