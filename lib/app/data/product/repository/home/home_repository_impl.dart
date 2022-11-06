import 'package:get/get.dart';

import '../../model/product_home/product_home_response.dart';
import '../../remote/home/home_remote_data_source.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteSource =
      Get.find(tag: (HomeRemoteDataSource).toString());

  @override
  Future<ProductHomeResponse> getHomePageProducts() {
    return _remoteSource.getHomePageProducts();
  }
}
