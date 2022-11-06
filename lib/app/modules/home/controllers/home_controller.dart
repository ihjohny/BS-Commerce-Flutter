import 'package:get/get.dart';

import '../../../data/product/model/product_home/product_home_response.dart';
import '../../../data/product/repository/home/home_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/home/model/ui_data.dart';

class HomeController extends BaseController {
  final HomeRepository _repository =
      Get.find(tag: (HomeRepository).toString());

  final Rx<UiData?> _data = Rx(null);

  UiData? get data => _data.value;

  getHomePageProducts() {
    callDataService(_repository.getHomePageProducts(), onSuccess: _handleDataResponse);
  }

  _handleDataResponse(ProductHomeResponse data) {
    _data(UiData(data));
  }
}
