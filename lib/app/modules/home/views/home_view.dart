import 'package:bs_commerce/app/modules/home/components/item_card.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getHomePageProducts();
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
    return GridView.count(
      mainAxisSpacing: 70,
      shrinkWrap:true,
      crossAxisSpacing: 0,
      crossAxisCount: 2,
      children: List.generate(
          controller.data?.value?.productHome?.length ?? 0,
          (index) => GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PRODUCT_DETAILS,
                    arguments: controller.data?.value?.productHome?[index].id);
              },
              child: ProductCard(controller.data?.value?.productHome?[index]))),
    );
  }
}
