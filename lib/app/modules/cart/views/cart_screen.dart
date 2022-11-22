import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/utils.dart';
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
    controller.getCart();
    controller.checkToken();

    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.pageCartBackground,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return  controller.data?.value!=null?ListView.separated(itemBuilder: (context,index){
      return CartComponentCard(cartComponentModel: controller.data!.value[index]!,
      );
    }, separatorBuilder: (context,index){
      return const Divider();
    }, itemCount: controller.data?.value.length??0): Center(child: Text("No Data Found",style: getTitleTextStyle(),),);
  }
}
