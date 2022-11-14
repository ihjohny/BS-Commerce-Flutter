import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController editingController;
  final String? labelText;
  final bool? obscureText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  Function()? onPressed;

   MyTextFormField(
      {Key? key,
      required this.editingController,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
        this.onPressed,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
        controller: editingController,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field must not be empty';
          }

          return null;
        },
        cursorColor: AppColors.searchFieldTextColor,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.searchFieldBgColor,
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppValues.buttonVerticalPadding,
                horizontal: AppValues.padding_4),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.searchFieldBgColor,
            prefixIconColor: AppColors.searchFieldBgColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColors.searchFieldBgColor,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelStyle: const TextStyle(
              color: AppColors.colorBlack,
            ),
            labelText: labelText));
  }
}
