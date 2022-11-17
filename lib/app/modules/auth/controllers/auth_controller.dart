import 'package:bs_commerce/app/core/base/base_controller.dart';
import 'package:bs_commerce/app/data/local/preference/preference_manager.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';
import '../../../data/network/repository/auth/auth_repo.dart';
import '../model/user.dart';
import '../views/sign_in_screen.dart';

class AuthController extends BaseController {
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  Rx<bool> otpSwitchState = Rx(false);
  Rx<bool> obsecureState = Rx(true);
  Rx<bool> nameEditTextState = Rx(false);
  Rx<bool> passwordEditTextState = Rx(false);
  Rx<bool> otpEditTextState = Rx(false);
  Rx<bool> numberEditTextState = Rx(false);
  Rx<bool> userNameEditTextState = Rx(false);
  Rx<bool> passwordSignInEditTextState = Rx(false);
  Rx<bool> namePasswordState = Rx(false);
  Rx<bool> isSignUpButtonEnable = Rx(false);
  Rx<bool> isSignInButtonEnable = Rx(false);

  Future<dynamic> sendOTP(String numberOrEmail) async {
    return callDataService(_repository.sendOTP(numberOrEmail),
        onError: (errorMessage) {
      Get.snackbar(AppValues.error, errorMessage.toString());
    }, onSuccess: (response) {
      return response;
    });
  }

  registerUser(String name, String numberOrEmail, String password, String otp) {
    callDataService(
        _repository
            .registerUser(User(
          phoneOrEmail: numberOrEmail,
          name: name,
          otp: otp,
          password: password,
        ))
            .then((value) {
          Get.snackbar(value.data!.message.toString(), "");
          if (value.code == AppValues.status_code_201) {
            Get.off(SignInScreen());
          }
        }), onError: (errorMessage) {
      Get.snackbar(AppValues.error, errorMessage.toString());
    });
  }

  signIn(String numberOrEmail, String password) {
    callDataService(
        _repository.signIn(numberOrEmail, password).then((value) {
          _preferenceManager
              .setString(AppValues.AUTH_TOKEN, value)
              .then((value) {
            if (value) {
              Get.snackbar(AppValues.tokenSaveSuccessfully, message);
              Get.offNamed(Routes.HOME);
            }
          });
        }), onError: (errorMessage) {
      Get.snackbar(AppValues.error, errorMessage.toString());
    });
  }
}
