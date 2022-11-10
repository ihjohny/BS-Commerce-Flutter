import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/base/base_view.dart';
import 'components/item_name_component.dart';
import 'components/quantity_row_view.dart';

class ProductDetailsScreen extends BaseView<ProductDetailsController> {
  ProductDetailsScreen() {
    controller.getProductDetails(Get.arguments.toString());
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
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
            backgroundColor: AppColors.colorWhite,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        elevation: 0.5,
                        child: Image.network(
                            controller.data?.value?.data?.photos?[0].url ?? "",
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppValues.getVerticalSpace(5.0),
                          ItemNameComponent(controller: controller),
                          const Divider(),
                          AppValues.getVerticalSpace(8),
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(controller
                                  .data?.value?.data?.info?.shortDescription ??
                              ""),
                          AppValues.getVerticalSpace(AppValues.minimumSpacing),
                          const QuantityRowView(),
                          AppValues.getVerticalSpace(AppValues.minimumSpacing),
                          const Divider(),
                          AppValues.getVerticalSpace(AppValues.minimumSpacing),
                          getAddToCartView(context)
                        ],
                      ),
                    )
                  ]),
            ))
        : const SizedBox();
  }

  

  Widget getAddToCartView(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Total Price"),
            AppValues.getVerticalSpace(5),
            Text(
              AppValues.getCustomizableString(
                  symbol: "\$",
                  value: controller.data?.value?.data?.info?.price.toString()),
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
       AppValues.getHorizontalSpace(15),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppValues.extraLargeRadius100),
              ))),
          onPressed: () {
            print("");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.colorWhite,
                ),
                AppValues.getHorizontalSpace(10),
                const Text(
                  "Add To Cart",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

