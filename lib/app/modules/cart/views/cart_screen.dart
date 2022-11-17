import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends BaseView<CartController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      automaticallyImplyLeading: false,
      elevation: 0,
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
      color: AppColors.colorWhite,
      child:  _getView(),
    );
  }

  Widget _getView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
        ),
      ),
    );
  }
}