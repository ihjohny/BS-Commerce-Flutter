import 'package:bs_commerce/app/data/network/model/check_out/check_out_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/modules/CheckOut/model/ui_data.dart';
import '../../../data/network/repository/cart/cart_repository.dart';

class CheckOutController extends BaseController {
  final CartRepository _repository = Get.find(tag: (CartRepository).toString());

  int totalPrice = 0;
  int totalQuantity = 0;

  final Rx<UiData?> _data = Rx(null);
  final RxBool isExpanded = RxBool(true);
  Rx<CheckOutAddress?>? address;

  @override
  void onInit() {
    address = _repository.address;
    totalPrice = _repository.totalPrice.value;
    totalQuantity = _repository.totalQuantity.value;
    super.onInit();
  }

  UiData? get data => _data.value;

  getCart() {
    callDataService(_repository.getCart());
  }

  setAddress(CheckOutAddress address) {
    debugPrint(_repository.setShippingAddress(address).toString());
  }
}
