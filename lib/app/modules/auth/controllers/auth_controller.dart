import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/product/repository/auth/auth_repo.dart';
import '../model/user.dart';

class AuthController extends BaseController {
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  Rx<String?> otp = Rx(null);

  Future<String> sendOTP(String numberOrEmail) async{
    return _repository.sendOTP(numberOrEmail);
  }

  registerUser(String name,String numberOrEmail,String password,String otp){
    _repository.registerUser(User(
      phoneOrEmail: numberOrEmail,
      name: name,
      otp: otp,
      password: password,
    ));
  }

  signIn(String numberOrEmail,String password){
    _repository.signIn(numberOrEmail, password);
  }
}
