import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/modules/auth/components/my_auth_button.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../components/authentication_footer.dart';
import '../components/my_text_form_field.dart';

class SignUpScreen extends BaseView<AuthController> {
  final numberControllerET = TextEditingController();
  final nameControllerET = TextEditingController();
  final passwordControllerET = TextEditingController();
  final otpControllerET = TextEditingController();

  final _formNumberKey = GlobalKey<FormState>();
  final _formNameKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.colorWhite,
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/bs_logo.png', height: AppValues.margin_100),
              AppValues.getVerticalSpace(AppValues.margin_20),
              const Text(
                AppValues.createYourAccount,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              AppValues.getVerticalSpace(AppValues.margin_20),
              numberInputForm(),
              AppValues.getVerticalSpace(AppValues.margin_20),
              nameInputForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget nameInputForm() {
    return Form(
      key: _formNameKey,
      child: Column(
        children: [
          getOtpView(),
          controller.namePasswordState.value
              ? getNameAndPasswordView()
              : const SizedBox()
        ],
      ),
    );
  }

  Column getNameAndPasswordView() {
    return Column(
      children: [
        AppValues.getVerticalSpace(AppValues.margin_10),
        MyTextFormField(
            editingController: nameControllerET,
            labelText: AppValues.enterYourName,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.iconColorDefault,
            )),
        AppValues.getVerticalSpace(AppValues.margin_10),
        MyTextFormField(
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.iconColorDefault,
            ),
            editingController: passwordControllerET,
            labelText: AppValues.enterYourPassword,
            obscureText: controller.obsecureState.value,
            suffixIcon: IconButton(
              icon: Icon(
                controller.obsecureState.value
                    ? Icons.visibility_off
                    : Icons.visibility_outlined,
                color: AppColors.iconColorDefault,
              ),
              onPressed: () {
                controller.obsecureState.value =
                    !controller.obsecureState.value;
              },
            )),
        AppValues.getVerticalSpace(AppValues.margin_15),
        MyAuthButton(
            onPressed: () {
              if (_formNameKey.currentState!.validate() ||
                  _formNumberKey.currentState!.validate()) {
                controller.registerUser(
                    nameControllerET.text,
                    numberControllerET.text,
                    passwordControllerET.text,
                    otpControllerET.text);
              }
            },
            buttonText: AppValues.signUp),
        AppValues.getVerticalSpace(AppValues.margin_10),
        const AuthenticationFooter()
      ],
    );
  }

  Row getOtpView() {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: MyTextFormField(
                editingController: otpControllerET,
                labelText: AppValues.otp,
                prefixIcon: const Icon(
                  Icons.sms_outlined,
                  color: AppColors.iconColorDefault,
                ))),
        Expanded(
          flex: 1,
          child: Switch(
            onChanged: (bool value) {
              if (numberControllerET.text.length ==
                      AppValues.phoneNumberLength ||
                  _formNumberKey.currentState!.validate()) {
                if (value) {
                  controller.otpSwitchState.value = value;
                  controller.sendOTP(numberControllerET.text).then((otp) {
                    otpControllerET.text = otp;
                    controller.namePasswordState.value = value;
                  });
                } else {
                  controller.otpSwitchState.value = false;
                  otpControllerET.text = "";
                  controller.namePasswordState.value = false;
                }
                _formNumberKey.currentState!.validate();
              }
            },
            value: controller.otpSwitchState.value,
          ),
        ),
        const Expanded(flex: 1, child: Text(AppValues.verify))
      ],
    );
  }

  Widget numberInputForm() {
    return Form(
        key: _formNumberKey,
        child: MyTextFormField(
            editingController: numberControllerET,
            labelText: AppValues.enterYourNumberEmail,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.iconColorDefault,
            )));
  }

  void destroyControllerEt() {
    nameControllerET.dispose();
    passwordControllerET.dispose();
    numberControllerET.dispose();
    otpControllerET.dispose();
  }
}

// class MyAuthButton extends StatelessWidget {
//   const MyAuthButton({
//     Key? key,
//     required GlobalKey<FormState> formNameKey,
//     required GlobalKey<FormState> formNumberKey,
//     required this.controller,
//     required this.nameControllerET,
//     required this.numberControllerET,
//     required this.passwordControllerET,
//     required this.otpControllerET,
//   }) : _formNameKey = formNameKey, _formNumberKey = formNumberKey, super(key: key);
//
//   final GlobalKey<FormState> _formNameKey;
//   final GlobalKey<FormState> _formNumberKey;
//   final AuthController controller;
//   final TextEditingController nameControllerET;
//   final TextEditingController numberControllerET;
//   final TextEditingController passwordControllerET;
//   final TextEditingController otpControllerET;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.black),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppValues.extraLargeRadius100),
//           ))),
//       onPressed: () {
//         if (_formNameKey.currentState!.validate() ||
//             _formNumberKey.currentState!.validate()) {
//           controller
//               .registerUser(nameControllerET.text, numberControllerET.text,
//                   passwordControllerET.text, otpControllerET.text)
//               .then((value) {
//             if (value.code == 200) {
//               Get.to(SignInScreen());
//             }
//           });
//         }
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "Sign Up",
//               style: TextStyle(color: AppColors.colorWhite),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
