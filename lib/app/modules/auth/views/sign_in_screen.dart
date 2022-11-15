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

import '../../../core/values/app_colors.dart';

class SignInScreen extends BaseView<AuthController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite,
      elevation: 0,
    );
    ;
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
            Image.asset('images/bs_logo.png',height: AppValues.margin_100),
            AppValues.getVerticalSpace(AppValues.margin_20),
            const Text("Login To Your Account",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            AppValues.getVerticalSpace(AppValues.margin_20),
            MyTextFormField(editingController: userNameController,labelText: "Enter Your Number or Email", prefixIcon: const Icon( Icons.email_outlined,color: AppColors.iconColorDefault)),
            AppValues.getVerticalSpace(AppValues.margin_10),
            MyTextFormField(
                prefixIcon: const Icon(Icons.lock, color: AppColors.iconColorDefault,),
                editingController: passwordController,
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
            AppValues.getVerticalSpace(AppValues.margin_10),
            MyAuthButton(onPressed: (){
              if(_formKey.currentState!.validate()||userNameController.text.length == AppValues.phoneNumberLength){
                makeSignIn(userNameController.text,passwordController.text);
              }
            },buttonText: "Sign In",),
            AppValues.getVerticalSpace(AppValues.margin_10),
            const Text("Forgot The Password?"),
            AppValues.getVerticalSpace(AppValues.margin_10),
            const AuthenticationFooter(),
        ],
            ),
          ),
        ),
      ),
    );
  }

  void makeSignIn(String userName, String password) {
    controller.signIn(userName, password);
  }
}
