import 'package:bs_commerce/app/modules/checkout/model/address.dart';
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../remote/cart/cart_remote_data_source.dart';
import 'checkout_repository.dart';

class CheckOutRepositoryImpl implements CheckOutRepository {
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
    return _remoteSource.addToCart(productId, quantity).then((value) {
      cartComponentCardList.clear();
      totalPrice.value = 0;
      totalQuantity.value = 0;
      mappingCartResponse(value);

      return value;
    });
  }

  void mappingCartResponse(CartResponse value) {
    value.data?.items?.forEach((element) {
      makeCalculation(element.product?.info?.price, element.quantity);
      cartComponentCardList.add(CartComponentModel(
          productPrice: element.product?.info?.price.toString() ?? "",
          productName: element.product?.info?.name.toString() ?? "",
          productImageUrl: element.product?.photoUrl.toString() ?? "",
          productId: element.product?.id.toString() ?? "",
          productCount: element.quantity.toString() ?? ""));
    });
  }

  @override
  Future<CartResponse> getCart() {
    return _remoteSource.getCart().then((value) {
      cartComponentCardList.clear();
      totalPrice.value = 0;
      totalQuantity.value = 0;
      mappingCartResponse(value);

      return value;
    });
  }

  void makeCalculation(int? price, int? quantity) {
    totalPrice.value = totalPrice.value + price! * quantity!;
    totalQuantity.value = totalQuantity.value + quantity!;
  }

  @override
  Future<CartResponse> deleteProduct(String productId) {
    return _remoteSource.deleteProduct(productId).then((value) {
      cartComponentCardList.clear();
      totalPrice.value = 0;
      totalQuantity.value = 0;
      mappingCartResponse(value);

      return value;
    });
  }

  @override
  Future<CartResponse> updateProduct(String productId, int quantity) {
    return _remoteSource.updateProduct(productId, quantity).then((value) {
      cartComponentCardList.clear();
      totalPrice.value = 0;
      totalQuantity.value = 0;
      mappingCartResponse(value);

      return value;
    });
  }

  @override
  Rx<Address?> address  = Rx(null);

  @override
  Address? setShippingAddress(Address v) {
    address.value= v;

    return address.value;
  }
}
