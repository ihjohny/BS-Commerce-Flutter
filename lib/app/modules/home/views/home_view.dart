import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getDetails();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.homeAppBarTitle,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return Text(
        controller.data?.value != null ? controller.data!.value : "Loading");
  }
}
