import 'package:bs_commerce/app/modules/auth/model/cart_component_model.dart';
import 'package:bs_commerce/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../routes/app_pages.dart';
import '../../cart/components/cart_component_card.dart';
import '../components/address_select_component.dart';
import '../components/bottom_payment_view.dart';
import '../components/checkout_form_view.dart';
import '../model/address.dart';
import '/app/core/base/base_view.dart';

class CheckOutScreen extends BaseView<CheckOutController> {
  List<CartComponentModel?>? cartComponentList;

  CheckOutScreen() {
    cartComponentList = Get.arguments;
    controller.getCart();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.pageBackground,
      elevation: 0,
      title: Text(
        appLocalization.checkOutAppBarTitle,
        style: getAppBarTitleTextStyle(),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        getPaymentButtonView(),
        Container(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppValues.collapsedAppBarSize),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_15,vertical: AppValues.margin_6),
                        child: Text(appLocalization.shippingAddress,style: getTitleTextStyle(),),
                      ),
                      controller.address?.value == null
                          ? getAddNewAddressView()
                          : AddressSelection(
                        shoppingAddressText: appLocalization.shippingAddress,
                        address: controller.address!.value!,
                      ),
                      const Divider(),
                    ],
                  )
                ,
                  Padding(
                    padding: const EdgeInsets.all(
                      AppValues.margin_15,
                    ),
                    child: getItemListRowView(),
                  ),
                  ListTile(title: getOrderItemList(),subtitle: getInvoiceView(),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column getInvoiceView() {
    return Column(
                children: [
                  const Divider(),
                  Space(height: AppValues.margin_20),
                  Container(
                    decoration: getCardStyle(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          getInvoiceItemView("Amount",controller.cartRepository.totalPrice.string),
                          Space(height: AppValues.margin_10),
                          getInvoiceItemView("Shipping","-"),
                          Space(height: AppValues.margin_10),
                          const Divider(),
                          getInvoiceItemView("Total",controller.cartRepository.totalPrice.string),
                        ],
                      ),
                    ),
                  ),
                ],
              );
  }

  Widget getItemListRowView() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(appLocalization.itemList, style: getTitleTextStyle()),
                    IconButton(
                        onPressed: () {
                          controller.isExpanded.value =
                              !controller.isExpanded.value;
                        },
                        icon: Icon(controller.isExpanded.value
                            ? Icons.expand_less_rounded
                            : Icons.expand_circle_down_outlined))
                  ],
                );
  }

  Positioned getPaymentButtonView() {
    return Positioned(
            child: BottomPaymentView(
              callBackFunction: () {
                controller.setAddress(Address("Shahin", "Bashar", "01613162522",
                    "Home", "Brain Station 23 Ltd, Mirpur DOHS",""));
              },
            ));
  }

  Expanded getOrderItemList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CartComponentCard(
              count: 0,
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
          itemCount:
              controller.isExpanded.value ? cartComponentList?.length ?? 0 : 0),
    );
  }

  Padding getAddNewAddressView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
          style: getButtonStyle(true, false),
          onPressed: () {
            Get.to( AddressForm());
            controller.placeOrder();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppValues.addNewAddress, style: getTitleTextStyleWhite()),
              ],
            ),
          )),
    );
  }

  Widget getInvoiceItemView(String title,String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(title),
        Text(value)
      ],
    );
  }
}
