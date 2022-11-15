import 'package:auth_buttons/auth_buttons.dart';
import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';

class AuthenticationFooter extends StatelessWidget {
  const AuthenticationFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppValues.getVerticalSpace(5),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Divider(
                  thickness: 1,
                )),
            Expanded(
                flex: 1,
                child: Text(
                  "Or Continue with",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )),
            Expanded(
                flex: 1,
                child: Divider(
                  thickness: 1,
                )),
          ],
        ),
        AppValues.getVerticalSpace(AppValues.margin_10),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: AppleAuthButton(
                  style: const AuthButtonStyle(
                    height: 50,
                      width: 50,
                      buttonColor: AppColors.colorWhite,
                      borderRadius: 200,
                      iconBackground: AppColors.colorPrimary),
                  onPressed: () {
                    ///TODO
                  },
                  text: "",
                )),
            AppValues.getHorizontalSpace(AppValues.margin_20),
            Expanded(
              flex: 1,
              child: GoogleAuthButton(
                  style: const AuthButtonStyle(
                      buttonColor: AppColors.colorWhite,
                      height: 50,
                      width: 50,
                      borderRadius: 50,
                      iconBackground: AppColors.colorPrimary),
                  onPressed: () {
                    ///TODO
                  },
                  text: ""),
            ),
            AppValues.getHorizontalSpace(AppValues.margin_20),
            Expanded(
                flex: 1,
                child: FacebookAuthButton(
                  style: const AuthButtonStyle(
                      buttonColor: AppColors.colorWhite,
                      borderRadius: 50,
                      height: 50,
                      width: 50,
                      iconBackground: AppColors.colorPrimary),
                  onPressed: (){
                    ///TODO
                  },
                  text: "",
                )),
          ],
        ),
      ],
    );
  }
}
