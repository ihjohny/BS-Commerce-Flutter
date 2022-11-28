import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../auth/model/cart_component_model.dart';

class BottomPaymentView extends StatelessWidget {


  const BottomPaymentView( {Key? key})
      : super(key: key);

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
            onPressed: () {
              ///TODO
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppValues.continueToPayment, style: getTitleTextStyleWhite()),
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
