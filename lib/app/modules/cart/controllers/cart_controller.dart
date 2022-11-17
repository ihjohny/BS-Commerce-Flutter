import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:bs_commerce/app/data/local/preference/preference_manager.dart';
import 'package:bs_commerce/app/data/network/repository/cart/cart_repository.dart';
import 'package:get/get.dart';


class CartController extends BaseController {
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  final CartRepository _cartRepository =
  Get.find(tag: (CartRepository).toString());

  getCart(){
    _cartRepository.getCart();
  }
}
