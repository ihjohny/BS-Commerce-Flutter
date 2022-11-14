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
        AppValues.getVerticalSpace(10),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: AppleAuthButton(
                  onPressed: () {
                    debugPrint("");
                  },
                  text: "",
                )),
            AppValues.getHorizontalSpace(10),
            Expanded(
              flex: 1,
              child: GoogleAuthButton(
                  onPressed: () {
                    debugPrint("");
                  },
                  text: ""),
            ),
            AppValues.getHorizontalSpace(10),
            Expanded(
                flex: 1,
                child: FacebookAuthButton(
                  style: const AuthButtonStyle(
                      buttonColor: AppColors.colorWhite,
                      iconBackground: AppColors.colorPrimary),
                  onPressed: () {
                    debugPrint("");
                  },
                  text: "",
                )),
          ],
        ),
      ],
    );
  }
}
