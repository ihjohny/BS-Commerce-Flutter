import 'package:get/get.dart';

import '../data/product/repository/catalogue_repository.dart';
import '../data/product/repository/catalogue_repository_impl.dart';


class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogueRepository>(
      () => CatalogueRepositoryImpl(),
      tag: (CatalogueRepository).toString(),
    );
  }
}
