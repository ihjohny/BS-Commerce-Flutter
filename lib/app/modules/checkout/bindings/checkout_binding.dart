import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';
import '../controllers/payment_controller.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(
      () => CheckOutController(),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}
