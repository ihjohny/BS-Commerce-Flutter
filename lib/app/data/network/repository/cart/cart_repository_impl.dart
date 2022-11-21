
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../remote/cart/cart_remote_data_source.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  final RxInt totalPrice = RxInt(0);
  @override
  final RxInt totalQuantity = RxInt(0);
  @override
  RxList<CartComponentModel?> cartComponentCardList = RxList();
  final CartRemoteDataSource _remoteSource =
      Get.find(tag: (CartRemoteDataSource).toString());

  @override
  Future<CartResponse> addToCart(String productId, int quantity) {
    return _remoteSource.addToCart(productId, quantity).then((value){
      cartComponentCardList.clear();
      value.data?.items?.forEach((element) {
        makeCalculation( element.product?.info?.price, element.quantity);
        cartComponentCardList.add(CartComponentModel(
            productPrice: element.product?.info?.price.toString()??"",
            productName: element.product?.info?.name.toString()??"",
            productImageUrl: element.product?.photoUrl.toString()??"",
            productId: element.product?.id.toString()??"",
            productCount:  element.quantity.toString()??""
        ));
      });

      return value;
    });
  }

  @override
  Future<CartResponse> getCart() {
    return _remoteSource.getCart().then((value){
      cartComponentCardList.clear();
      value.data?.items?.forEach((element) {
        makeCalculation( element.product?.info?.price, element.quantity);
        cartComponentCardList.add(CartComponentModel(
            productPrice: element.product?.info?.price.toString()??"",
            productName: element.product?.info?.name.toString()??"",
            productImageUrl: element.product?.photoUrl.toString()??"",
            productId: element.product?.id.toString()??"",
            productCount:  element.quantity.toString()??""
        ));
      });

      return value;
    });
  }
  void makeCalculation(int? price, int? quantity) {
    totalPrice.value = totalPrice.value + price!;
    totalQuantity.value = totalQuantity.value + quantity!;
  }
}
