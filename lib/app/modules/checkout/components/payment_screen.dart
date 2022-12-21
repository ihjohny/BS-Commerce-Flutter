import 'package:bs_commerce/app/data/network/model/check_out/products.dart';
import 'package:bs_commerce/app/modules/checkout/components/payment_card.dart';
import 'package:bs_commerce/app/modules/checkout/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../components/bottom_payment_view.dart';
import '../model/payment.dart';

class PaymentScreen extends BaseView<PaymentController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.pageBackground,
      elevation: 0,
      title: Text(
        appLocalization.paymentMethods,
        style: getAppBarTitleTextStyle(),
      ),
    );
  }

  PaymentScreen() {
    controller.getPaymentMethodList();
  }

  @override
  Widget? bottomNavigationBar() {
    return getPaymentButtonView();
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppValues.collapsedAppBarSize),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Select the payment method you want to use"),
            ),
          ),
          getPaymentOptionList(),
        ],
      ),
    );
  }

  Widget getPaymentButtonView() {
    return BottomPaymentView(
      buttonText: "Place Order",
      callBackFunction: () {
        controller.placeOrder(
            10,
            controller.address!.value!,
            controller.address!.value!,
            controller.listOfPaymentOptions
                .where((p0) => p0.isSelected == true)
                .first
                .paymentName,
            controller.cartComponentCardList
                .map((e) => Products(
                    totalPrice: controller.totalPrice,
                    quantity: int.tryParse(e?.productCount ?? "0"),
                    price: int.tryParse(e?.productPrice ?? "0"),
                    name: e?.productName,
                    productId: e?.productId,
                    sku: e?.productImageUrl))
                .toList());
      },
    );
  }

  Widget getPaymentOptionList() {
    return SizedBox(
      height: Get.height / 1.5,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PaymentCard(
              paymentOption: controller.listOfPaymentOptions[index],
              clicked: () {
                controller.listOfPaymentOptions.value =
                    toggleOption(controller.listOfPaymentOptions, index);
              },
            );
          },
          itemCount: controller.listOfPaymentOptions.length),
    );
  }

  List<PaymentOption> toggleOption(
      List<PaymentOption> listOfPaymentOptions, int index) {
    int count = 0;

    return listOfPaymentOptions.map((e) {
      if (count == index) {
        listOfPaymentOptions[index].isSelected =
            !listOfPaymentOptions[index].isSelected;
      } else {
        listOfPaymentOptions[count].isSelected = false;
      }
      count++;

      return e;
    }).toList();
  }
}
