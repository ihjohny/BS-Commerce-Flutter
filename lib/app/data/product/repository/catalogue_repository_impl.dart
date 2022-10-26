import 'package:get/get.dart';

import '../model/data_model.dart';
import '../remote/catalogue_remote_data_source.dart';
import 'catalogue_repository.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueRemoteDataSource _remoteSource =
      Get.find(tag: (CatalogueRemoteDataSource).toString());

  @override
  Future<Data> getDetails() {
    return _remoteSource.getDetails();
  }
}
