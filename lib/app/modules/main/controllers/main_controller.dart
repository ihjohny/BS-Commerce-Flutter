import 'package:get/get.dart';

import '../../../core/model/page_state.dart';
import '../../../data/network/repository/cart/cart_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/main/model/menu_code.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;
  final CartRepository cartRepository =
      Get.find(tag: (CartRepository).toString());
  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) {
    _selectedMenuCodeController(menuCode);
  }
}
