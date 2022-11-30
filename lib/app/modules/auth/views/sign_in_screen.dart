import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/auth/components/authentication_footer.dart';
import 'package:bs_commerce/app/modules/auth/components/my_auth_button.dart';
import 'package:bs_commerce/app/modules/auth/components/my_text_form_field.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';

class SignInScreen extends BaseView<AuthController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 0,
      automaticallyImplyLeading:false,
    );
  }


  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/bs_logo.png', height: AppValues.margin_100),
                Space(height:AppValues.margin_20),
                const Text(
                  AppValues.loginToYoureAccount,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Space(height:AppValues.margin_20),
                getUserNameView(),
                Space(height:AppValues.margin_20),
                getPasswordView(),
                Space(height:AppValues.margin_20),
                getMyAuthButton(),
                Space(height:AppValues.margin_10),
                const Text(AppValues.forgotPassword),
                Space(height:AppValues.margin_10),
                const AuthenticationFooter(),
                Space(height:AppValues.margin_20),
                getDontHaveAccountView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  MyTextFormField getUserNameView() {
    return MyTextFormField(
        onPressed: (value) {
          if (value.isNotEmpty) {
            controller.userNameEditTextState.value = true;
            controller.isSignInButtonEnable.value = checkAuthButtonStatus();
          } else {
            controller.userNameEditTextState.value = false;
            controller.isSignInButtonEnable.value = checkAuthButtonStatus();
          }
        },
        editingController: userNameController,
        labelText: AppValues.enterYourNumberEmail,
        prefixIcon: Icon(Icons.email_outlined,
            color: controller.userNameEditTextState.value
                ? AppColors.colorBlack
                : AppColors.iconColorDefault));
  }

  MyTextFormField getPasswordView() {
    return MyTextFormField(
        onPressed: (value) {
          if (value.isNotEmpty) {
            controller.passwordSignInEditTextState.value = true;
            controller.isSignInButtonEnable.value = checkAuthButtonStatus();
          } else {
            controller.passwordSignInEditTextState.value = false;
            controller.isSignInButtonEnable.value = checkAuthButtonStatus();
          }
        },
        prefixIcon: Icon(
          Icons.lock,
          color: controller.passwordSignInEditTextState.value
              ? AppColors.colorBlack
              : AppColors.iconColorDefault,
        ),
        editingController: passwordController,
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
            controller.obsecureState.value = !controller.obsecureState.value;
          },
        ));
  }
bool checkAuthButtonStatus(){
    return (passwordController.text.isNotEmpty && userNameController.text.isNotEmpty);
}
  Row getDontHaveAccountView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppValues.dontHaveAnAccount,
          style: TextStyle(color: AppColors.textColorGreyLight),
        ),
      Space(width:AppValues.margin_10),
        GestureDetector(
            onTap: () {
              Get.offNamed(Routes.SIGN_UP);
            },
            child: const Text(
              AppValues.signUp,
              style: TextStyle(color: AppColors.colorBlack,fontSize: 16,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),

            ))
      ],
    );
  }

  MyAuthButton getMyAuthButton() {
    return MyAuthButton(
      onPressed: () {
        if (_formKey.currentState!.validate() ||
            userNameController.text.length == AppValues.phoneNumberLength) {
          makeSignIn(userNameController.text, passwordController.text);
        }
      },
      isEnableButton: controller.isSignInButtonEnable.value,
      buttonText: AppValues.signIn,
    );
  }

  void makeSignIn(String userName, String password) {
    controller.signIn(userName, password);
  }
}
