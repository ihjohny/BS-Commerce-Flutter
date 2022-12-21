import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '../controllers/bottom_nav_controller.dart';
import '../model/menu_code.dart';
import '../model/menu_item.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  BottomNavBar({Key? key, required this.onNewMenuSelected}) : super(key: key);
  late AppLocalizations appLocalization;

  final navController = BottomNavController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    appLocalization = AppLocalizations.of(context)!;

    Color selectedItemColor = Colors.black;
    Color unselectedItemColor = Colors.black26;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "images/${navItem.iconSvgName}",
                    height: AppValues.iconDefaultSize,
                    width: AppValues.iconDefaultSize,
                    color:
                        navItems.indexOf(navItem) == navController.selectedIndex
                            ? selectedItemColor
                            : unselectedItemColor,
                  ),
                  label: navItem.navTitle,
                  tooltip: ""),
            )
            .toList(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.appBarColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          BottomNavController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      BottomNavItem(
        navTitle: appLocalization.bottomNavHome,
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: appLocalization.bottomNavCart,
          iconSvgName: "shopping_cart.svg",
          menuCode: MenuCode.CART),
      BottomNavItem(
          navTitle: appLocalization.bottomNavProfile,
          iconSvgName: "profile.svg",
          menuCode: MenuCode.AUTH)
    ];
  }
}
