import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';

class BottomPaymentView extends StatelessWidget {
  final String buttonText;
  const BottomPaymentView(
      {Key? key, required this.callBackFunction, required this.buttonText})
      : super(key: key);
  final VoidCallback callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.collapsedAppBarSize,
      decoration: const BoxDecoration(
          color: AppColors.pageCartBackground,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppValues.largeRadius),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppValues.smallPadding, horizontal: AppValues.margin_15),
        child: TextButton(
            style: getButtonStyle(true, true),
            onPressed: callBackFunction,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonText, style: getTitleTextStyleWhite()),
                  Space(width: AppValues.margin_15),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.colorWhite,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
