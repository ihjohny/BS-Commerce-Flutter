import 'package:flutter/material.dart';
import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
class MyAuthButton extends StatelessWidget {
  final bool isEnableButton;
  final Function() onPressed;
  final String buttonText;
  const MyAuthButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.isEnableButton
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:getButtonStyle(true,isEnableButton),
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
