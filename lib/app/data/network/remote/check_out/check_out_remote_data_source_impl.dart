import 'package:bs_commerce/app/data/network/model/check_out/order_payload.dart';
import 'package:bs_commerce/app/data/network/model/check_out/order_response.dart';
import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '../../../../network/dio_provider.dart';
import 'check_out_remote_data_source.dart';

class CheckOutRemoteDataSourceImpl extends BaseRemoteSource
    implements CheckOutRemoteDataSource {
  @override
  Future<CartResponse> addToCart(String productId, int quantity) async {
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .post(endpoint, data: {"productId": productId, "quantity": quantity});

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseCartResponse(response));
  }

  @override
  Future<CartResponse> getCart() {
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient.get(endpoint);

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseCartResponse(response));
  }

  CartResponse _parseCartResponse(Response<dynamic> response) {
    return CartResponse.fromJson(response.data);
  }

  @override
  Future<CartResponse> deleteProduct(String productId) {
    var endpoint = "${DioProvider.baseUrl}api/cart/item";
    var dioCall = dioClient
        .delete(endpoint, queryParameters: {"productId": productId.toString()});

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseCartResponse(response));
  }

  @override
  Future<CartResponse> updateProduct(String productId, int quantity) {
    var endpoint = "${DioProvider.baseUrl}api/cart/item";
    var dioCall = dioClient
        .patch(endpoint, data: {"productId": productId, "quantity": quantity});

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseCartResponse(response));
  }

  @override
  Future<OrderSuccessResponse?> placeOrder(OrderPayload orderPayload) {
    var endpoint = "${DioProvider.baseUrl}api/customer/order";
    var dioCall = dioClient.get(endpoint);
    callApiWithErrorParser(dioCall);

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseOrderResponse(response));
  }

  OrderSuccessResponse _parseOrderResponse(Response<dynamic> response) {
    return OrderSuccessResponse.fromJson(response.data);
  }
}
