import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/modules/auth/components/my_auth_button.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:bs_commerce/app/modules/auth/views/sign_in_screen.dart';
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
    return Center(
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return SingleChildScrollView(
      child: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.colorWhite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numberInputForm(),
            AppValues.getVerticalSpace(15),
            nameInputForm()
          ],
        ),
      )),
    );
  }

  Widget nameInputForm() {
    return Form(
      key: _formNameKey,
      child: Column(
        children: [
          getOtpView(),
          controller.namePasswordState.value
              ? Column(
                  children: [
                    AppValues.getVerticalSpace(10),
                    MyTextFormField(
                        editingController: nameControllerET,
                        labelText: "Enter Your Name",
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.iconColorDefault,
                        )),
                    AppValues.getVerticalSpace(10),
                    MyTextFormField(
                      prefixIcon: Icon(Icons.lock, color: AppColors.iconColorDefault,),
                        editingController: passwordControllerET,
                        labelText: "Enter Your Password",
                        obscureText: controller.obsecureState.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obsecureState.value?Icons.visibility_off:Icons.visibility_outlined,
                            color: AppColors.iconColorDefault,
                          ),
                          onPressed: () {
                            controller.obsecureState.value =
                                !controller.obsecureState.value;
                          },
                        )),
                    AppValues.getVerticalSpace(15),
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
                        buttonText: "Sign Up"),
                    AppValues.getVerticalSpace(10),
                    const AuthenticationFooter()
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Row getOtpView() {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: MyTextFormField(
                editingController: otpControllerET,
                labelText: "OTP",
                prefixIcon: const Icon(
                  Icons.sms_outlined,
                  color: AppColors.iconColorDefault,
                ))),
        Expanded(
          flex: 1,
          child: Switch(
            onChanged: (bool value) {
              if (numberControllerET.text.length == 11 ||
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
        const Expanded(flex: 1, child: Text("Verify"))
      ],
    );
  }

  Widget numberInputForm() {
    return Form(
        key: _formNumberKey,
        child: MyTextFormField(
            editingController: numberControllerET,
            labelText: "Enter Your Number or Email",
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
