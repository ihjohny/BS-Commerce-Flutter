import '../../model/product_home/product_home_response.dart';

abstract class HomeRemoteDataSource {
  Future<ProductHomeResponse> getHomePageProducts();
}
