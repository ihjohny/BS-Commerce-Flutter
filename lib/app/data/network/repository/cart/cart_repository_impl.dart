import 'package:bs_commerce/app/data/network/model/check_out/check_out_address.dart';
import 'package:bs_commerce/app/data/network/model/check_out/order_payload.dart';
import 'package:bs_commerce/app/modules/checkout/model/payment.dart';
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../model/check_out/order_response.dart';
import '../../remote/cart/cart_remote_data_source.dart';
import 'cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  static CartRepositoryImpl? _instance;

  CartRepositoryImpl._internal();

  factory CartRepositoryImpl() => _instance ??= CartRepositoryImpl._internal();
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
  final Rx<CheckOutAddress?> address = Rx(null);

  @override
  CheckOutAddress? setShippingAddress(CheckOutAddress v) {
    address.value = v;

    return address.value;
  }

  @override
  clearCart() {
    cartComponentCardList.clear();
    totalPrice(0);
    totalQuantity(0);
  }

  @override
  Future<List<PaymentOption>> getPaymentMethodList() {
    return Future<List<PaymentOption>>(() => [
          PaymentOption(
              paymentName: "My Wallet",
              amount: "100",
              isSelected: true,
              imageUrl: 'images/bs_logo.png'),
          PaymentOption(
              paymentName: "My Wallet",
              amount: "100",
              imageUrl: 'images/bs_logo.png'),
          PaymentOption(
              paymentName: "My Wallet",
              amount: "100",
              imageUrl: 'images/bs_logo.png'),
          PaymentOption(
              paymentName: "My Wallet",
              amount: "100",
              imageUrl: 'images/bs_logo.png'),
          PaymentOption(
              paymentName: "My Wallet",
              amount: "100",
              imageUrl: 'images/bs_logo.png'),
        ]);
  }

  @override
  Future<OrderSuccessResponse?> placeOrder(OrderPayload orderPayload) {
    return _remoteSource.placeOrder(orderPayload);
  }
}
