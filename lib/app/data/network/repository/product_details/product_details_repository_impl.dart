
import 'package:bs_commerce/app/data/network/repository/product_details/product_details_repository.dart';
import 'package:get/get.dart';

import '../../model/product_details/response.dart';
import '../../remote/product_details/product_details_remote_data_source.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource _remoteSource =
      Get.find(tag: (ProductDetailsRemoteDataSource).toString());

  @override
  Future<ProductDetailsResponse> getProductDetails(String productId) {
    return _remoteSource.getProductDetails(productId);
  }
}
