import '../../model/product_home/response.dart';

abstract class HomeRepository {
  Future<ProductHomeResponse> getHomePageProducts();
}
