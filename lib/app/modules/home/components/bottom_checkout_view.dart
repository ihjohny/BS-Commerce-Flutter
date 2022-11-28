import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../auth/model/cart_component_model.dart';

class BottomCheckOutView extends StatelessWidget {
  final String totalPrice;
  final List<CartComponentModel?> cartComponentList;

  const BottomCheckOutView( {Key? key, required this.totalPrice,required this.cartComponentList})
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppValues.totalPrice,style: getTitleTextStyle(),),
                  Space(height: AppValues.margin_10),
                  Text(totalPrice + "\$",style: getTitleTextStyle(),)
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                  style: getButtonStyle(true, true),
                  onPressed: () {
                    Get.toNamed(Routes.CHECKOUT,arguments: cartComponentList);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppValues.checkOut, style: getTitleTextStyleWhite()),
                        Space(width: AppValues.margin_15),
                        const Icon(
                          Icons.arrow_circle_right_outlined,
                          color: AppColors.colorWhite,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
