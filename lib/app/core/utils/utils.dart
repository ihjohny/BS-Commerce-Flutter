import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_values.dart';

ButtonStyle getButtonStyle(bool isPrimary, bool isEnabled) {
  return ButtonStyle(
      backgroundColor: isPrimary
          ? MaterialStateProperty.all(isEnabled ? Colors.black : Colors.black26)
          : MaterialStateProperty.all(
              isPrimary ? Colors.white : Colors.white10),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.extraLargeRadius100),
      )));
}
BoxDecoration getCardStyle() {
  return const BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.all(Radius.circular(AppValues.margin_15)),
    shape: BoxShape.rectangle,
  );
}

String getCurrencyString(String string){
  return "\$$string";
}

TextStyle getTitleTextStyle() {
  return const TextStyle(
    color: AppColors.colorBlack,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getAppBarTitleTextStyle() {
  return const TextStyle(
    color: AppColors.colorBlack,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getSubTitleTextStyle() {
  return const TextStyle(
    color: AppColors.colorBlack,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getTitleTextStyleWhite() {
  return const TextStyle(
    color: AppColors.colorWhite,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

SizedBox Space({double width = 0, double height = 0}) {
  return SizedBox(
    width: width,
    height: height,
  );
}
