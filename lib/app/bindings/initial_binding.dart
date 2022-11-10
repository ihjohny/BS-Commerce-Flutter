import 'package:bs_commerce/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_bindings.dart';
import 'local_source_bindings.dart';
import 'remote_source_bindings.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
    ProductDetailsBinding().dependencies();
    AuthBindings().dependencies();
  }
}
