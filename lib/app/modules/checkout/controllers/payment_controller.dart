import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:bs_commerce/app/data/network/model/check_out/order_response.dart';
import 'package:bs_commerce/app/modules/checkout/components/check_out_succes.dart';
import 'package:get/get.dart';

import '../../../data/network/model/check_out/check_out_address.dart';
import '../../../data/network/repository/cart/cart_repository.dart';
import '../../auth/model/cart_component_model.dart';
import '../model/payment.dart';

class PaymentController extends BaseController {
  final CartRepository _repository = Get.find(tag: (CartRepository).toString());
  RxList<PaymentOption> listOfPaymentOptions = RxList();
  List<CartComponentModel?> cartComponentCardList = [];
  int totalPrice = 0;
  int totalQuantity = 0;
  Rx<CheckOutAddress?>? address;

  @override
  void onInit() {
    address = _repository.address;
    totalPrice = _repository.totalPrice.value;
    totalQuantity = _repository.totalQuantity.value;
    cartComponentCardList = _repository.cartComponentCardList;
    super.onInit();
  }

  placeOrder(String paymentMethod) {
    callDataService(_repository.placeOrder(paymentMethod),
        onSuccess: (OrderSuccessResponse? value) {
      if (value != null) {
        _repository.clearCart();
        Get.dialog(CheckOutSuccess());
      }
    });
  } // _handleDataResponse(ProductCheckOutResponse data) {

//   _data(UiData(data));
// }
  getPaymentMethodList() async {
    listOfPaymentOptions.value = await _repository.getPaymentMethodList();
  }
}
