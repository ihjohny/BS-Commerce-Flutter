import 'package:bs_commerce/app/data/network/remote/product_details/product_details_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/values/app_values.dart';
import '../../../../network/dio_provider.dart';
import '../../../local/preference/preference_manager.dart';
import '../../model/product_details/response.dart';
import '/app/core/base/base_remote_source.dart';

class ProductDetailsRemoteDataSourceImpl extends BaseRemoteSource
    implements ProductDetailsRemoteDataSource {
  final PreferenceManager _preferenceManager =
  Get.find(tag: (PreferenceManager).toString());

  @override
  Future<ProductDetailsResponse> getProductDetails(String productId) {
    var endpoint = "${DioProvider.baseUrl}api/customer/products/$productId";
    var dioCall = dioClient.get(endpoint);

    return callApiWithErrorParser(dioCall)
        .then((response) => _parseProductCatalogResponse(response));
  }

  ProductDetailsResponse _parseProductCatalogResponse(
      Response<dynamic> response) {
    return ProductDetailsResponse.fromJson(response.data);
  }

  @override
  Future addToCart(String productId, int quantity)async {
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .post(endpoint, data: {"productId": productId, "quantity": quantity});

    return callApiWithErrorParser(dioCall);
  }
}
