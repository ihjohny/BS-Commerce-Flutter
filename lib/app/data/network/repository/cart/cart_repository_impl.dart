
import 'package:bs_commerce/app/data/network/repository/product_details/product_details_repository.dart';
import 'package:bs_commerce/app/modules/product_details/model/add_to_cart_response.dart';
import 'package:get/get.dart';

import '../../model/product_details/response.dart';
import '../../remote/cart/cart_remote_data_source.dart';
import '../../remote/product_details/product_details_remote_data_source.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteSource =
      Get.find(tag: (CartRemoteDataSource).toString());

  @override
  Future addToCart(String productId, int quantity) {
    return _remoteSource.addToCart(productId, quantity);
  }

  @override
  Future getCart() {
    return _remoteSource.getCart();
  }
}
