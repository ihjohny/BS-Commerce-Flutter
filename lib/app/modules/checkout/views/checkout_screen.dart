import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/checkout/components/checkout_form_view.dart';
import 'package:bs_commerce/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';

class CheckOutScreen extends BaseView<CheckOutController> {
  CheckOutScreen() {
    controller.getCart();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.homeAppBarTitle,
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return controller.data.toString().isNotEmpty?AddressForm():AddressForm();
  }
}
