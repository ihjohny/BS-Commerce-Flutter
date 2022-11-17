import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/modules/auth/components/my_auth_button.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
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
      automaticallyImplyLeading:false,
      elevation: 0,
    );
  }
  @override
  Color statusBarColor() {
    return AppColors.colorWhite;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.colorWhite;
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
              : const SizedBox(),
          AppValues.getVerticalSpace(AppValues.margin_20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppValues.alreadyHaveAnAccount,style: TextStyle(
                  color: AppColors.textColorGreyLight
              ),),
              AppValues.getHorizontalSpace(AppValues.margin_10),
              GestureDetector(onTap: (){
                Get.offNamed(Routes.SIGN_IN);
              }, child: const Text(AppValues.signIn,style: TextStyle(color: AppColors.colorBlack,fontSize: 16,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),))
            ],
          )
        ],
      ),
    );
  }
  bool checkAuthButtonStatus(){
    return (passwordControllerET.text.isNotEmpty && numberControllerET.text.isNotEmpty);
  }
  Column getNameAndPasswordView() {
    return Column(
      children: [
        getNamedView(),
        getPasswordView(),
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
            isEnableButton: controller.isSignUpButtonEnable.value,
            buttonText: AppValues.signUp),
        AppValues.getVerticalSpace(AppValues.margin_10),
        const AuthenticationFooter(),
      ],
    );
  }

  Widget getNamedView() {
    return Column(children: [
      AppValues.getVerticalSpace(AppValues.margin_10),
      MyTextFormField(
          onPressed: (value) {
            if (value.isNotEmpty) {
              controller.nameEditTextState.value = true;
              controller.isSignUpButtonEnable.value=checkAuthButtonStatus();
            } else {
              controller.nameEditTextState.value = false;
              controller.isSignUpButtonEnable.value=checkAuthButtonStatus();
            }
          },
          editingController: nameControllerET,
          labelText: AppValues.enterYourName,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: controller.nameEditTextState.value
                ? AppColors.colorBlack
                : AppColors.iconColorDefault,
          )),
      AppValues.getVerticalSpace(AppValues.margin_10),
    ]);
  }
  Widget getPasswordView() {
    return Column(children: [
      MyTextFormField(
          onPressed: (value) {
            if (value.isNotEmpty) {
              controller.passwordEditTextState.value = true;
              controller.isSignUpButtonEnable.value=checkAuthButtonStatus();
            } else {
              controller.passwordEditTextState.value = false;
              controller.isSignUpButtonEnable.value=checkAuthButtonStatus();
            }
          },
          prefixIcon: Icon(
            Icons.lock,
            color: controller.passwordEditTextState.value
                ? AppColors.colorBlack
                : AppColors.iconColorDefault,
          ),
          editingController: passwordControllerET,
          labelText: AppValues.enterYourPassword,
          obscureText: controller.obsecureState.value,
          suffixIcon: IconButton(
            icon: Icon(
              controller.obsecureState.value
                  ? Icons.visibility_off
                  : Icons.visibility_outlined,
              color: controller.passwordEditTextState.value
                  ? AppColors.colorBlack
                  : AppColors.iconColorDefault,
            ),
            onPressed: () {
              controller.obsecureState.value =
              !controller.obsecureState.value;
            },
          )),
      AppValues.getVerticalSpace(AppValues.margin_15),
    ]);
  }

  Row getOtpView() {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: MyTextFormField(
                editingController: otpControllerET,
                labelText: AppValues.otp,
                onPressed: (value) {
                  if (value.isNotEmpty) {
                    controller.otpEditTextState.value = true;
                  } else {
                    controller.otpEditTextState.value = false;
                  }
                },
                prefixIcon: Icon(
                  Icons.sms_outlined,
                  color: controller.otpEditTextState.value
                      ? AppColors.colorBlack
                      : AppColors.iconColorDefault,
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
                    controller.otpEditTextState.value = true;
                  });
                } else {
                  controller.otpSwitchState.value = false;
                  controller.otpEditTextState.value = false;
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
            onPressed: (value) {
              if (value.isNotEmpty) {
                controller.numberEditTextState.value = true;
              } else {
                controller.numberEditTextState.value = false;
              }
            },
            prefixIcon: Icon(
              Icons.email_outlined,
              color: controller.numberEditTextState.value
                  ? AppColors.colorBlack
                  : AppColors.iconColorDefault,
            )));
  }

  void destroyControllerEt() {
    nameControllerET.dispose();
    passwordControllerET.dispose();
    numberControllerET.dispose();
    otpControllerET.dispose();
  }
}