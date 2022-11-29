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
    return CircleAvatar(
      backgroundColor: AppColors.colorPrimary,
      child: IconButton(
          color: Theme.of(context).scaffoldBackgroundColor,
          onPressed: null,
          icon: const Icon(
            Icons.favorite_border,
            color: AppColors.colorWhite,
          )),
    );
  }
}