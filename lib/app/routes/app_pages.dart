import 'package:bs_commerce/app/modules/cart/views/cart_screen.dart';
import 'package:bs_commerce/app/modules/main/bindings/main_binding.dart';
import 'package:bs_commerce/app/modules/main/views/main_view.dart';
import 'package:bs_commerce/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:bs_commerce/app/modules/product_details/views/product_details_screen.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_bindings.dart';
import '../modules/auth/views/sign_in_screen.dart';
import '../modules/auth/views/sign_up_screen.dart';
import '../modules/cart/bindings/cart_bindings.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartScreen(),
      binding: CartBindings(),
    ),
  ];
}
