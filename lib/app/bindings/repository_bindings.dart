import 'package:bs_commerce/app/data/network/repository/cart/cart_repository.dart';
import 'package:get/get.dart';

import '../data/network/repository/auth/auth_repo.dart';
import '../data/network/repository/auth/auth_repo_imp.dart';
import '../data/network/repository/cart/cart_repository_impl.dart';
import '../data/network/repository/home/home_repository.dart';
import '../data/network/repository/home/home_repository_impl.dart';
import '../data/network/repository/product_details/product_details_repository.dart';
import '../data/network/repository/product_details/product_details_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(),
        tag: (HomeRepository).toString(), fenix: true);
    Get.lazyPut<ProductDetailsRepository>(() => ProductDetailsRepositoryImpl(),
        tag: (ProductDetailsRepository).toString(), fenix: true);

    Get.lazyPut<AuthRepo>(() => AuthRepoImp(),
        tag: (AuthRepo).toString(), fenix: true);

    Get.lazyPut<CartRepository>(() => CartRepositoryImpl(),
        tag: (CartRepository).toString(), fenix: true);
  }
}
