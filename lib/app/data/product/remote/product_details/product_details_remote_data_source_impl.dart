import 'package:bs_commerce/app/data/product/model/product_details/ProductDetailsResponse.dart';
import 'package:bs_commerce/app/data/product/remote/product_details/product_details_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../network/dio_provider.dart';
import '/app/core/base/base_remote_source.dart';

class ProductDetailsRemoteDataSourceImpl extends BaseRemoteSource
    implements ProductDetailsRemoteDataSource {
  @override
  Future<ProductDetailsResponse> getProductDetails(String productId) {
    var endpoint = "${DioProvider.baseUrl}api/customer/products/$productId";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProductCatalogResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProductDetailsResponse _parseProductCatalogResponse(
      Response<dynamic> response) {
    return ProductDetailsResponse.fromJson(response.data);
  }
}
