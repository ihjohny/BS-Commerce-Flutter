import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/home/components/item_card.dart';
import 'package:bs_commerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../data/product/model/product_home/model_product_home.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/home/controllers/home_controller.dart';

class ProductDetailsView extends BaseView<ProductDetailsController> {
  late final ProductHome? _productHome;

  ProductDetailsView() {
    _productHome = controller.data?.value?.data;
    controller.getProductDetails("");
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Obx(() => _getView(context)),
    );
  }

  Widget _getView(BuildContext context) {
    return controller.data?.value?.data != null
        ? Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Image.network(controller.data?.value?.data?.photos?[0].url ?? "",fit: BoxFit.fill),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(controller.data?.value?.data?.info?.name ?? "",style: Theme.of(context).textTheme.titleLarge,),
            )
          ]))
        : SizedBox();
  }
}
