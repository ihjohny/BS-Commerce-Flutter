import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/product_details/model/product_details_ui_data.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/network/model/product_details/response.dart';
import '../../../data/network/repository/cart/cart_repository.dart';
import '../../../data/network/repository/product_details/product_details_repository.dart';
import '/app/core/base/base_controller.dart';

class ProductDetailsController extends BaseController {
  final ProductDetailsRepository _repository =
      Get.find(tag: (ProductDetailsRepository).toString());
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  final CartRepository _cartRepository =
      Get.find(tag: (CartRepository).toString());

  final RxDouble count = 0.0.obs;

  final Rx<ProductDetailsUiData?> _data = Rx(null);

  ProductDetailsUiData? get data => _data.value;

  getProductDetails(String productId) {
    callDataService(_repository.getProductDetails(productId),
        onSuccess: _handleDataResponse);
  }

  addToCart(String productId, double quantity)async {
    _preferenceManager.getString(AppValues.AUTH_TOKEN).then((value){
      hideLoading();
      if(value.isNotEmpty){
        callDataService(_cartRepository.addToCart(productId, quantity.toInt()));
      }else{
       Get.toNamed(Routes.SIGN_UP);
       hideLoading();
      }
    });
  }

  _handleDataResponse(ProductDetailsResponse data) {
    _data(ProductDetailsUiData(data));
  }
}
