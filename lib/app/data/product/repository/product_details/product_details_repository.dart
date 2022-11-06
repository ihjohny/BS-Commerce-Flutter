import 'package:bs_commerce/app/data/product/model/product_details/ProductDetailsResponse.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsResponse> getProductDetails(String productId);
}
