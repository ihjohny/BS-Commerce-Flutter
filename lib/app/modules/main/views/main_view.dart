import 'package:bs_commerce/app/modules/auth/views/sign_in_screen.dart';
import 'package:bs_commerce/app/modules/auth/views/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.CART:
        signUpScreen ??= SignUpScreen();
        return signUpScreen!;
      case MenuCode.SETTINGS:
        signInScreen ??= SignInScreen();
        return signInScreen!;
      default:
        return homeView;

      // case MenuCode.SETTINGS:
      //   settingsView ??= SettingsView();
      //   return settingsView!;
      // default:
      //   return OtherView(
      //     viewParam: describeEnum(menuCode),
      //   );
    }
  }
}
