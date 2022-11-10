import 'package:flutter/material.dart';

import '../../../../core/widget/rating_and_sold.dart';
import '../../controllers/product_details_controller.dart';
import 'favorite_icon.dart';
class ItemNameComponent extends StatelessWidget {
  const ItemNameComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.data?.value?.data?.info?.name ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const RatingAndSoldComponent(
              ratings: 5,
              soldValue: 200,
            )
          ],
        ),
        const FavoriteIcon()
      ],
    );
  }
}
