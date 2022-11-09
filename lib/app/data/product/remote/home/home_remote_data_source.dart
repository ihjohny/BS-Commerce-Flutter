import '../../model/product_home/response.dart';

abstract class HomeRemoteDataSource {
  Future<ProductHomeResponse> getHomePageProducts();
}
