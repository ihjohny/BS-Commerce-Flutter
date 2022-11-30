import 'package:bs_commerce/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../product_details/controllers/product_details_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(),
        fenix: true);
    Get.lazyPut<CheckOutController>(() => CheckOutController(), fenix: true);
    // Get.lazyPut<SettingsController>(
    //   () => SettingsController(),
    // );
  }
}
