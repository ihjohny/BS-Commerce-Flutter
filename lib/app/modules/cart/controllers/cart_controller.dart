import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:bs_commerce/app/data/local/preference/preference_manager.dart';
import 'package:bs_commerce/app/data/network/repository/cart/cart_repository.dart';
import 'package:bs_commerce/app/modules/cart/model/ui_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../product_details/model/cart_response.dart';


class CartController extends BaseController {
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  final CartRepository _cartRepository =
  Get.find(tag: (CartRepository).toString());
  final Rx<UiData?> _data = Rx(null);

  UiData? get data => _data.value;


  getCart(){
    callDataService(_cartRepository.getCart(),onSuccess: _handleDataResponse);
  }
  _handleDataResponse(CartResponse data) {
    _data(UiData(data));
  }
}
