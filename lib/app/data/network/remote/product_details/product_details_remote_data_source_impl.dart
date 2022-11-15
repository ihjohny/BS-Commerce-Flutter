import 'package:bs_commerce/app/data/network/remote/product_details/product_details_remote_data_source.dart';
import 'package:dio/dio.dart';
import '../../../../network/dio_provider.dart';
import '../../model/product_details/response.dart';
import '/app/core/base/base_remote_source.dart';

class ProductDetailsRemoteDataSourceImpl extends BaseRemoteSource
    implements ProductDetailsRemoteDataSource {
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
}
