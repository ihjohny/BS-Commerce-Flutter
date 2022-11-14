import 'package:get/get.dart';

import '../data/network/remote/auth/auth_remote_data_source.dart';
import '../data/network/remote/auth/auth_remote_data_source_imp.dart';
import '../data/network/remote/home/home_remote_data_source.dart';
import '../data/network/remote/home/home_remote_data_source_impl.dart';
import '../data/network/remote/product_details/product_details_remote_data_source.dart';
import '../data/network/remote/product_details/product_details_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
      tag: (HomeRemoteDataSource).toString(),
    );

    Get.lazyPut<ProductDetailsRemoteDataSource>(
        () => ProductDetailsRemoteDataSourceImpl(),
        tag: (ProductDetailsRemoteDataSource).toString(),
        fenix: true);

    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImp(),
        tag: (AuthDataSource).toString(), fenix: true);
  }
}
