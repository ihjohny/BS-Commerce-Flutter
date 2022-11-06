import 'package:bs_commerce/app/data/product/model/product_details/ProductDetailsResponse.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsResponse> getProductDetails(String productId);
}
