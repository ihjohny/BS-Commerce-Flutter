import 'package:bs_commerce/app/modules/auth/model/cart_component_model.dart';

class UiData {
  final List<CartComponentModel?> value;
  final String totalPrice;
  final String totalQuantity;

  UiData(this.value,this.totalPrice,this.totalQuantity);
}
