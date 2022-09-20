import 'package:get/get.dart';

import '/app/data/repository/catalogue_repository.dart';
import '/app/data/repository/catalogue_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogueRepository>(
      () => CatalogueRepositoryImpl(),
      tag: (CatalogueRepository).toString(),
    );
  }
}
