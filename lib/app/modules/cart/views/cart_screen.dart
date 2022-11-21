import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../auth/model/cart_component_model.dart';
import '../components/cart_component_card.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends BaseView<CartController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.homeCartBarTitle,
      isBackButtonEnabled: false,
    );
  }
CartScreen(){
    controller.getCart();
}
  @override
  Color statusBarColor() {
    return AppColors.colorWhite;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.colorWhite;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      color: AppColors.pageCartBackground,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return  controller.data?.value?.data?.items?.length!=0?ListView.separated(itemBuilder: (context,index){
      return CartComponentCard(cartComponentModel: CartComponentModel(
        productCount: controller.data?.value?.data?.items?[index].quantity.toString()??"",
        productId: controller.data?.value?.data?.items?[index].productId.toString()??"" ,
        productImageUrl:  controller.data?.value?.data?.items?[index].product?.photoUrl??"",
        productName:  controller.data?.value?.data?.items?[index].product?.info?.name.toString()??"",
        productPrice: controller.data?.value?.data?.items?[index].product?.info?.price.toString()??""
      ),
      );
    }, separatorBuilder: (context,index){
      return Divider();
    }, itemCount: controller.data?.value?.data?.items?.length??0):const Center(child: Text("No Data Found"),);
  }
}