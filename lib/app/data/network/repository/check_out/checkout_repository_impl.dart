import 'package:bs_commerce/app/data/network/model/check_out/order_payload.dart';
import 'package:bs_commerce/app/data/network/model/check_out/order_response.dart';
import 'package:bs_commerce/app/modules/checkout/model/address.dart';
import 'package:get/get.dart';

import '../../../../modules/auth/model/cart_component_model.dart';
import '../../remote/check_out/check_out_remote_data_source.dart';
import 'checkout_repository.dart';

class CheckOutRepositoryImpl implements CheckOutRepository {
  static CheckOutRepositoryImpl? _instance;
  CheckOutRepositoryImpl._internal();

  final CheckOutRemoteDataSource _remoteSource =
  Get.find(tag: (CheckOutRemoteDataSource).toString());

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

  @override
  Future<OrderResponse?> placeOrder(OrderPayLoad orderPayload) {
    return _remoteSource.placeOrder(orderPayload);
  }
}
