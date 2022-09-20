import 'package:get/get.dart';

import '/app/data/remote/catalogue_remote_data_source.dart';
import '/app/data/repository/catalogue_repository.dart';
import '../model/data_model.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueRemoteDataSource _remoteSource =
      Get.find(tag: (CatalogueRemoteDataSource).toString());

  @override
  Future<Data> getDetails() {
    return _remoteSource.getDetails();
  }
}
