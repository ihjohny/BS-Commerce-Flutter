
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../remote/cart/cart_remote_data_source.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteSource =
      Get.find(tag: (CartRemoteDataSource).toString());

  @override
  Future addToCart(String productId, int quantity) {
    return _remoteSource.addToCart(productId, quantity);
  }

  @override
  Future<CartResponse> getCart() {
    return _remoteSource.getCart();
  }
}
