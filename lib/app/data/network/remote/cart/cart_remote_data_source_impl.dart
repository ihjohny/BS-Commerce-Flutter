import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../../core/values/app_values.dart';
import '../../../../network/dio_provider.dart';
import '../../../local/preference/preference_manager.dart';
import '/app/core/base/base_remote_source.dart';
import 'cart_remote_data_source.dart';

class CartRemoteDataSourceImpl extends BaseRemoteSource
    implements CartRemoteDataSource {
  final PreferenceManager _preferenceManager =
  Get.find(tag: (PreferenceManager).toString());
  @override
  Future addToCart(String productId, int quantity) async{
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .post(endpoint, data: {"productId": productId, "quantity": quantity});

    return callApiWithErrorParser(dioCall)
        .then((response) => debugPrint(response.data.toString()));
  }

  @override
  Future getCart() {
    var endpoint = "${DioProvider.baseUrl}api/cart";
    var dioCall = dioClient
        .get(endpoint);

    return callApiWithErrorParser(dioCall)
        .then((response) => debugPrint(response.data.toString()));
  }

}
