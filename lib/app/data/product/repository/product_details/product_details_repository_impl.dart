
import 'package:bs_commerce/app/data/product/model/product_details/ProductDetailsResponse.dart';
import 'package:bs_commerce/app/data/product/remote/product_details/product_details_remote_data_source.dart';
import 'package:bs_commerce/app/data/product/repository/product_details/product_details_repository.dart';
import 'package:get/get.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource _remoteSource =
      Get.find(tag: (ProductDetailsRemoteDataSource).toString());

  @override
  Future<ProductDetailsResponse> getProductDetails(String productId) {
    return _remoteSource.getProductDetails(productId);
  }
}
