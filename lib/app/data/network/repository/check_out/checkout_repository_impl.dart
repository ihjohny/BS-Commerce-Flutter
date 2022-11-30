import 'package:bs_commerce/app/modules/checkout/model/address.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import 'checkout_repository.dart';

class CheckOutRepositoryImpl implements CheckOutRepository {
  static CheckOutRepositoryImpl? _instance;
  CheckOutRepositoryImpl._internal();

  factory CheckOutRepositoryImpl() => _instance ??= CheckOutRepositoryImpl._internal();

  @override
  RxList<CartComponentModel?> cartComponentCardList = RxList();

  @override
  final Rx<Address?> address  = Rx(null);

  @override
  Address? setShippingAddress(Address v) {
    address.value= v;

    return address.value;
  }
}
