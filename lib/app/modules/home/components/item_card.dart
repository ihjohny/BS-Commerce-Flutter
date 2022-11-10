import 'package:bs_commerce/app/core/values/app_values.dart';
import 'package:bs_commerce/app/core/widget/rating_and_sold.dart';
import 'package:bs_commerce/app/modules/product_details/views/components/favorite_icon.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../data/product/model/product_home/home.dart';
import '../../../theme/dimen.dart';

class ProductCard extends StatelessWidget {
  final ProductHome? data;

  const ProductCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Material(
        color: AppColors.colorWhite,
        elevation: 1,
          borderRadius: BorderRadius.circular(PRODUCT_CARD_RADIUS),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.network(
                  data?.photos?.first.url ?? "",
                  fit: BoxFit.cover,
                  height: PRODUCT_CARD_WIDTH,
                ),
              ),
              const Positioned(
                  top: 5,
                  left: CARD_LEFT_POSITION_PADDING,
                  right: 5,
                  child: FavoriteIcon())
            ],
          )),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppValues.getVerticalSpace(8),
          Text(
            data?.info?.name ?? "",
            maxLines: 2,
            style: const TextStyle(
              fontSize: AppValues.height_16,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          const RatingAndSoldComponent(ratings: 5, soldValue: 100),
          Text(AppValues.getCustomizableString(symbol: "\$", value: data?.info?.price.toString()),
              style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
