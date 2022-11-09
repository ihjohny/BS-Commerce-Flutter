import 'package:bs_commerce/app/core/values/app_colors.dart';
import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';

import '../../../../theme/dimen.dart';
class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: FAVORITE_ICON_BTN_HEIGHT,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle),
        width: FAVORITE_ICON_BTN_WIDTH,
        child: Material(
          borderRadius: BorderRadius.circular(AppValues.largeRadius),
          elevation: 1,
          child: IconButton(
              color: Theme.of(context).scaffoldBackgroundColor,
              onPressed: null,
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.colorPrimary,
              )),
        ));
  }
}