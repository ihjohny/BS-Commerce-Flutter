import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/auth/views/sign_in_screen.dart';
import 'package:bs_commerce/app/modules/auth/views/sign_up_screen.dart';
import 'package:bs_commerce/app/modules/home/components/bottom_checkout_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_screen.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onNewMenuSelected: controller.onMenuSelected);
  }

  final HomeView homeView = HomeView();
  SignUpScreen? signUpScreen;
  SignInScreen? signInScreen;
  CartScreen? cartScreen;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return stackView(homeView);
      case MenuCode.CART:
        cartScreen ??= CartScreen();
        return stackView(cartScreen!);
      case MenuCode.SETTINGS:
        signInScreen ??= SignInScreen();
        return signInScreen!;
      case MenuCode.AUTH:
        signInScreen ??= SignInScreen();
        return signInScreen!;
      default:
        return homeView;
    }
  }

  Widget stackView(Widget view) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: controller.cartRepository.totalQuantity != 0
                  ? AppValues.collapsedAppBarSize
                  : 0),
          child: view,
        ),
        Positioned(
            child: controller.cartRepository.totalQuantity != 0
                ? BottomCheckOutView(
                    totalPrice: controller.cartRepository.totalPrice.toString())
                : SizedBox())
      ],
    );
  }
}
