import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/network/model/auth/registration_success.dart';
import '../../../data/network/repository/auth/auth_repo.dart';
import '../model/user.dart';
import '../views/sign_in_screen.dart';

class AuthController extends BaseController {
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  Rx<bool> otpSwitchState = Rx(false);
  Rx<bool> obsecureState = Rx(false);
  Rx<bool> namePasswordState = Rx(false);

  Future<String> sendOTP(String numberOrEmail) async{
    return _repository.sendOTP(numberOrEmail);
  }

 registerUser(String name,String numberOrEmail,String password,String otp){
    return _repository.registerUser(User(
      phoneOrEmail: numberOrEmail,
      name: name,
      otp: otp,
      password: password,
    )).then((value) {
      Get.snackbar(value.data!.message.toString(), "");
      if (value.code == 201) {
        Get.off(SignInScreen());
      }
    });
  }

   signIn(String numberOrEmail,String password){
     _repository.signIn(numberOrEmail, password).then((value) => debugPrint(value.toString()));
  }
}
