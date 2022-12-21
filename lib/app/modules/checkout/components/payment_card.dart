import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_values.dart';
import '../model/payment.dart';

class PaymentCard extends StatelessWidget {
  final PaymentOption paymentOption;
  final Function() clicked;

  const PaymentCard({required this.paymentOption, required this.clicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clicked,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: getCardStyle(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: AppValues.margin_40,
                        height: AppValues.margin_40,
                        child: Image.asset(paymentOption.imageUrl)),
                    Space(width: AppValues.margin_20),
                    Text(paymentOption.paymentName),
                  ],
                ),
                Row(
                  children: [
                    paymentOption.isSelected
                        ? Text(paymentOption.amount)
                        : const SizedBox(),
                    Space(width: AppValues.margin_20),
                    paymentOption.isSelected
                        ? const Icon(
                            Icons.check_circle_rounded,
                            size: AppValues.margin_30,
                            color: AppColors.colorPrimary,
                          )
                        : const Icon(Icons.check_box_outline_blank),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
