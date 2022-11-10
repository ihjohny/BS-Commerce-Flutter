import 'package:bs_commerce/app/core/base/base_view.dart';
import 'package:bs_commerce/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';

class SignUpScreen extends BaseView<AuthController> {
  final numberControllerET = TextEditingController();
  final nameControllerET = TextEditingController();
  final passwordControllerET = TextEditingController();
  final otpControllerET = TextEditingController();

  final _formNumberKey = GlobalKey<FormState>();
  final _formNameKey = GlobalKey<FormState>();
  //
  // doSomething() async {
  //   controller.signIn("8801613162522", "123456");
  //   controller.sendOTP("01521435353");
  // }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Obx(() => _getView()),
    );
  }

  Widget _getView() {
    return (controller.otp.value == null) ? Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formNumberKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: numberControllerET,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Your Number OR Email"
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 11) {
                              return 'Please enter some text';
                            }

                            return null;
                          },
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        flex: 2,
                        child: TextButton(
                            onPressed: () async {
                              if (_formNumberKey.currentState!.validate()) {
                                otpControllerET.text = await controller
                                    .sendOTP(numberControllerET.text);
                              }
                            },
                            child: Text("Get OTP")),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: otpControllerET,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              )),
          Form(
            key: _formNameKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Name"
                  ),
                  controller:nameControllerET ,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Password"
                  ),
                  controller:passwordControllerET ,
                ),
                MaterialButton(onPressed: (){
                  controller.registerUser(nameControllerET.text, numberControllerET.text, passwordControllerET.text, otpControllerET.text);
                },
                child: Text("Sign Up"),)
              ],
            ),
          )
        ],
      ),
    ):SizedBox();
  }
}
