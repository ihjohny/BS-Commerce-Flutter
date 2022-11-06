import 'package:bs_commerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:get/get.dart';


class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
  }
}
