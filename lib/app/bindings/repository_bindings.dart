import 'package:bs_commerce/app/data/product/repository/auth/auth_repo_imp.dart';
import 'package:bs_commerce/app/data/product/repository/product_details/product_details_repository.dart';
import 'package:bs_commerce/app/data/product/repository/product_details/product_details_repository_impl.dart';
import 'package:get/get.dart';

import '../data/product/repository/auth/auth_repo.dart';
import '../data/product/repository/home/home_repository.dart';
import '../data/product/repository/home/home_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(),
      tag: (HomeRepository).toString(),
    );
    Get.lazyPut<ProductDetailsRepository>(() => ProductDetailsRepositoryImpl(),
        tag: (ProductDetailsRepository).toString(), fenix: true);

    Get.lazyPut<AuthRepo>(() => AuthRepoImp(),
        tag: (AuthRepo).toString(), fenix: true);
  }
}
