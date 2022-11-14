import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
class MyAuthButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const MyAuthButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppValues.extraLargeRadius100),
              ))),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.colorWhite),
            ),
          ),
        ],
      ),
    );
  }
}
