import 'package:bs_commerce/app/data/product/model/product_catelog_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../network/dio_provider.dart';
import '/app/core/base/base_remote_source.dart';
import '../model/data_model.dart';
import 'catalogue_remote_data_source.dart';

class CatalogueRemoteDataSourceImpl extends BaseRemoteSource
    implements CatalogueRemoteDataSource {
  @override
  Future<ProductCatalogResponse> getDetails() {
    var endpoint = "${DioProvider.baseUrl}api/customer/home-page-products";
    var dioCall = dioClient.get(endpoint);

    try {
       return callApiWithErrorParser(dioCall)
          .then((response)=>_parseProductCatalogResponse(response));
    } catch (e) {
      rethrow;
    }
  }
  ProductCatalogResponse _parseProductCatalogResponse(
      Response<dynamic> response) {
    return ProductCatalogResponse.fromJson(response.data);
  }
}
