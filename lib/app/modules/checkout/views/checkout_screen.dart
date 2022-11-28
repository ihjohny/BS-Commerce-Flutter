import 'package:bs_commerce/app/modules/auth/model/cart_component_model.dart';
import 'package:bs_commerce/app/modules/checkout/components/checkout_form_view.dart';
import 'package:bs_commerce/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../routes/app_pages.dart';
import '../../cart/components/cart_component_card.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';

class CheckOutScreen extends BaseView<CheckOutController> {
  List<CartComponentModel?>? cartComponentList;
  CheckOutScreen() {
    cartComponentList = Get.arguments;
    controller.getCart();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: "",
      actions: [
        Container(
          color: AppColors.pageCartBackground,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    appLocalization.checkOutAppBarTitle,
                    style: getTitleTextStyle(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: Get.height,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !controller.haveAddress.value?Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                    style: getButtonStyle(true, true),
                    onPressed: () {
                      Get.toNamed(Routes.CHECKOUT,arguments: cartComponentList);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppValues.addNewAddress , style: getTitleTextStyleWhite()),
                        ],
                      ),
                    )),
              ):const SizedBox(),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: AppValues.margin_15,),
                child: Text("Order List",style: getTitleTextStyle()),
              ),
              Expanded(child:ListView.builder(
                  itemBuilder: (context, index) {
                    return CartComponentCard(
                      haveDeleteButton: true,
                      cartComponentModel: cartComponentList![index]!,
                      onValueChanged: (value) {
                        ///TODO
                      },
                      onValueDeleted: () {
                       ///TODO
                      },
                    );
                  },
                  itemCount: cartComponentList?.length ?? 0))
            ],
          );

  }
}
