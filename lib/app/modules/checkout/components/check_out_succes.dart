import 'package:bs_commerce/app/core/utils/utils.dart';
import 'package:bs_commerce/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:bs_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';

class CheckOutSuccess extends StatelessWidget {
  const CheckOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/bs_logo.png'),
            Space(height: AppValues.margin_10),
            Text(
              AppValues.orderSuccessful,
              style: getAppBarTitleTextStyle(),
            ),
            Space(height: AppValues.margin_10),
            const Text(AppValues.youHaveSuccessfullyMadeorder),
            Space(height: AppValues.margin_20),
            TextButton(
              onPressed: () {
                Get.offNamed(Routes.MAIN);
                BottomNavController.updateSelectedIndex(0);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 2),
                child: Text(
                  AppValues.viewOrder,
                  style: TextStyle(color: AppColors.colorWhite),
                ),
              ),
              style: getButtonStyle(true, true),
            ),
            Space(height: AppValues.margin_20),
          ],
        ),
      ),
    );
  }
}
