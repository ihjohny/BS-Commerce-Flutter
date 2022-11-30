import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(),fenix: true);
  }
}
