import 'package:bs_commerce/app/data/product/model/product_catelog_response.dart';
import 'package:get/get.dart';

import '../../../data/product/repository/catalogue_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/modules/home/model/ui_data.dart';

class HomeController extends BaseController {
  final CatalogueRepository _repository =
      Get.find(tag: (CatalogueRepository).toString());

  final Rx<UiData?> _data = Rx(null);

  UiData? get data => _data.value;

  getDetails() {
    callDataService(_repository.getDetails(), onSuccess: _handleDataResponse);
  }

  _handleDataResponse(ProductCatalogResponse data) {
    _data(UiData(data));
  }
}
