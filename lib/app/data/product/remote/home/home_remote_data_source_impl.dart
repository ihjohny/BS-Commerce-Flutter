import 'package:dio/dio.dart';
import '../../../../network/dio_provider.dart';
import '../../model/product_home/product_home_response.dart';
import '/app/core/base/base_remote_source.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends BaseRemoteSource
    implements HomeRemoteDataSource {
  @override
  Future<ProductHomeResponse> getHomePageProducts() {
    var endpoint = "${DioProvider.baseUrl}api/customer/home-page-products";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProductCatalogResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  ProductHomeResponse _parseProductCatalogResponse(
      Response<dynamic> response) {
    return ProductHomeResponse.fromJson(response.data);
  }
}
