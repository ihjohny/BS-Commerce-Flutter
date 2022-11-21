import 'package:bs_commerce/app/modules/product_details/model/cart_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../network/dio_provider.dart';
import '/app/core/base/base_remote_source.dart';
import 'cart_remote_data_source.dart';

class CartRemoteDataSourceImpl extends BaseRemoteSource
    implements CartRemoteDataSource {
  @override
  Future<CartResponse> addToCart(String productId, int quantity) async{
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .post(endpoint, data: {"productId": productId, "quantity": quantity});

    return callApiWithErrorParser(dioCall)
        .then((response)=>_parseCartResponse(response));
  }

  @override
  Future<CartResponse> getCart() {
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .get(endpoint);

    return callApiWithErrorParser(dioCall)
        .then((response)=>_parseCartResponse(response));
  }
  CartResponse _parseCartResponse(
      Response<dynamic> response) {
    debugPrint("Shahin"+response.data.toString());

    return CartResponse.fromJson(response.data);
  }
}
