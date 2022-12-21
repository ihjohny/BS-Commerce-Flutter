import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:bs_commerce/app/data/local/preference/preference_manager.dart';
import 'package:bs_commerce/app/data/network/repository/cart/cart_repository.dart';
import 'package:bs_commerce/app/modules/cart/model/ui_data.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';
import '../../../routes/app_pages.dart';
import '../../product_details/model/cart_response.dart';

class CartController extends BaseController {
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  final CartRepository _cartRepository =
      Get.find(tag: (CartRepository).toString());
  final Rx<UiData?> _data = Rx(null);

  UiData? get data => _data.value;
  checkToken() {
    _preferenceManager.getString(AppValues.AUTH_TOKEN).then((value) {
      if (value.isNotEmpty) {
        callDataService(_cartRepository.getCart());
      } else {
        Get.toNamed(Routes.SIGN_IN);
      }
    });
  }

  getCart() {
    callDataService(_cartRepository.getCart(), onSuccess: _handleDataResponse);
  }

  updateCart(String productId, int quantity) {
    if (quantity <= 0) {
      deleteProduct(productId);
    } else {
      callDataService(_cartRepository.updateProduct(productId, quantity),
          onSuccess: _handleDataResponse);
    }
  }

  deleteProduct(String productId) {
    callDataService(_cartRepository.deleteProduct(productId),
        onSuccess: _handleDataResponse);
  }

  _handleDataResponse(CartResponse data) {
    _data(UiData(
        _cartRepository.cartComponentCardList,
        _cartRepository.totalPrice.toString(),
        _cartRepository.totalQuantity.toString()));
  }

  addToCart(String productId, double quantity) {
    callDataService(_cartRepository.addToCart(productId, quantity.toInt()),
        onSuccess: _handleDataResponse);
  }

  clearCart() {
    _cartRepository.clearCart();
  }
}
