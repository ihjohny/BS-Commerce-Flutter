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

TextStyle getTitleTextStyle() {
  return  const TextStyle(
    color: AppColors.colorBlack,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}