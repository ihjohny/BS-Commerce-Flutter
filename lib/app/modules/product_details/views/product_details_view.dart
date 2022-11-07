import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/home/components/item_card.dart';
import 'package:bs_commerce/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../data/product/model/product_home/model_product_home.dart';
import '../../../theme/dimen.dart';
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
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(controller.data?.value?.data?.photos?[0].url ?? "",
                fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.data?.value?.data?.info?.name ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      getFavoriteIconView(context)
                    ],
                  ),
                  SizedBox(height: 10,),
                  const Divider(),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(controller.data?.value?.data?.info?.shortDescription ??
                      ""),
                  SizedBox(height: 10,),
                  getQuantityRowView(context),
                  SizedBox(height: 10,),
                  const Divider(),
                   SizedBox(height: 10,),
                   getAddToCartView(context)
                ],
              ),
            )
          ]))
        : const SizedBox();
  }

  Widget getFavoriteIconView(BuildContext context) {
    return Container(
        height: FAVORITE_ICON_BTN_HEIGHT,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle),
        width: FAVORITE_ICON_BTN_WIDTH,
        child: IconButton(
            color: Theme.of(context).scaffoldBackgroundColor,
            onPressed: null,
            icon: Icon(
              Icons.favorite_border,
              color: Theme.of(context).primaryColor,
            )));
  }

  Widget getQuantityRowView(BuildContext context) {
    return Row(
      children: [
         Text("Quantity",style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(
                  Radius.circular(300))),
          child: Card(
            borderOnForeground: false,
            clipBehavior: Clip.hardEdge,
            color:Theme.of(context).scaffoldBackgroundColor ,
            elevation: 5,
            child: CustomizableCounter(
              borderRadius: AppValues.largeRadius,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              borderColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        )
      ],
    );
  }

  Widget getAddToCartView(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Price"),
            SizedBox(height: 5,),
            Text( "\$ ${controller.data?.value?.data?.info?.price.toString()}"??"",style: Theme.of(context).textTheme.titleLarge,)
          ],
        ),
        SizedBox(width: 15,),
        Container(
          constraints: BoxConstraints(
            maxHeight: 38
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              color: Colors.black
          ),
          child: MaterialButton(
            hoverElevation: 0,
            onPressed: (){
            print("");
          },
            child: Text("Add To Cart",style: TextStyle(
              color: Colors.white
            ),),
          ),
        )
      ],
    );
  }
}
