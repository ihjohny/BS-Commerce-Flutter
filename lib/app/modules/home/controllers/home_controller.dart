import 'package:get/get.dart';

import '../../../data/network/model/product_home/response.dart';
import '../../../data/network/repository/cart/cart_repository.dart';
import '../../../data/network/repository/home/home_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/home/model/ui_data.dart';

class HomeController extends BaseController {
  final HomeRepository _repository = Get.find(tag: (HomeRepository).toString());
  final CartRepository cartRepository =
      Get.find(tag: (CartRepository).toString());
  final Rx<UiData?> _data = Rx(null);

  UiData? get data => _data.value;

  getHomePageProducts() {
    callDataService(_repository.getHomePageProducts(),
        onSuccess: _handleDataResponse);
  }
  getCart() {
    callDataService(cartRepository.getCart());
  }

  onRefresh() {
    getHomePageProducts();
  }

  _handleDataResponse(ProductHomeResponse data) {
    _data(UiData(data));
  }
}
