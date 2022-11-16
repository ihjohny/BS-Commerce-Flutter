import 'package:get/get.dart';

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
    // Get.lazyPut<CartController>(
    //   () => CartController(),
    // );
    // Get.lazyPut<SettingsController>(
    //   () => SettingsController(),
    // );
  }
}
