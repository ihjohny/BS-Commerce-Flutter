import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_values.dart';

class QuantityRowView extends StatelessWidget {
  final Function(double value)? function;
  double initialValue;

   QuantityRowView({Key? key, required this.function,required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Quantity",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomizableCounter(
          borderRadius: AppValues.extraLargeRadius100,
          backgroundColor: AppColors.colorWhite,
          count: initialValue,
          onCountChange: function,
          borderColor: Theme.of(context).scaffoldBackgroundColor,
        )
      ],
    );
  }
}
