
import '../../model/product_home/product_home_response.dart';

abstract class HomeRepository {
  Future<ProductHomeResponse> getHomePageProducts();
}
