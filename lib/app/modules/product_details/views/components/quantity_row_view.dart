import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_values.dart';
class QuantityRowView extends StatelessWidget {
  const QuantityRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Quantity",style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(width: 10,),
        Material(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(AppValues.extraLargeRadius100),
          elevation: 1,
          animationDuration: Duration.zero,
          borderOnForeground: false,
          child: CustomizableCounter(
            borderRadius: AppValues.extraLargeRadius100,
            backgroundColor: AppColors.colorWhite,
            borderColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        )
      ],
    );
  }
}
