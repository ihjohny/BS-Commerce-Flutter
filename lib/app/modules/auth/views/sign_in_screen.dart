import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/modules/auth/components/authentication_footer.dart';
import 'package:bs_commerce/app/modules/auth/components/my_auth_button.dart';
import 'package:bs_commerce/app/modules/auth/components/my_text_form_field.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';

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

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget body(BuildContext context) {
    return Center(
      child: _getView(),
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
            const Text("Login To Your Account",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            AppValues.getVerticalSpace(20),
            MyTextFormField(editingController: userNameController,labelText: "Enter Your Number or Email", prefixIcon: const Icon( Icons.email_outlined,color: AppColors.iconColorDefault)),
            AppValues.getVerticalSpace(10),
            MyTextFormField(
                prefixIcon: Icon(Icons.lock, color: AppColors.iconColorDefault,),
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
            AppValues.getVerticalSpace(10),
            MyAuthButton(onPressed: (){
              makeSignIn(userNameController.text,passwordController.text);
            },buttonText: "Sign In",),
            AppValues.getVerticalSpace(10),
            const Text("Forgot The Password?"),
            AppValues.getVerticalSpace(10),
            const AuthenticationFooter(),
          ],
        ),
      )),
    );
  }

  void makeSignIn(String userName, String password) {
    controller.signIn(userName, password);
  }
}
