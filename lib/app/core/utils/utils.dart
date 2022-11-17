import 'package:flutter/material.dart';

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
