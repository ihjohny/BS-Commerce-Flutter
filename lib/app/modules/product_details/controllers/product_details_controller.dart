import 'package:bs_commerce/app/data/product/model/product_details/ProductDetailsResponse.dart';
import 'package:bs_commerce/app/data/product/repository/product_details/product_details_repository.dart';
import 'package:bs_commerce/app/modules/product_details/model/product_details_ui_data.dart';
import 'package:get/get.dart';

import '../../../data/product/model/product_home/product_home_response.dart';
import '/app/core/base/base_controller.dart';

class ProductDetailsController extends BaseController {
  final ProductDetailsRepository _repository =
      Get.find(tag: (ProductDetailsRepository).toString());

  final Rx<ProductDetailsUiData?> _data = Rx(null);

  ProductDetailsUiData? get data => _data.value;

  @override
  void onInit() {
    var dataModel = Get.arguments;
    if (dataModel is String) {
      getProductDetails(dataModel);
    }
    super.onInit();
  }


  getProductDetails(String productId) {
    callDataService(_repository.getProductDetails(productId),
        onSuccess: _handleDataResponse);
  }

  _handleDataResponse(ProductDetailsResponse data) {
    _data(ProductDetailsUiData(data));
  }
}
