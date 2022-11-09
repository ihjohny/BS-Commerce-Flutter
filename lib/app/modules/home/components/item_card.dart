import 'package:flutter/material.dart';

import '../../../data/product/model/product_home/home.dart';
import '../../../theme/dimen.dart';

class ProductCard extends StatelessWidget {
  final ProductHome? data;

  const ProductCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(PRODUCT_CARD_RADIUS)),
          child: Stack(
            children: [
              Image.network(
                data?.photos?.first.url ?? "",
                height: PRODUCT_CARD_WIDTH,
              ),
              Positioned(
                  top: 5,
                  left: CARD_LEFT_POSITION_PADDING,
                  right: 5,
                  child: Container(
                      height: FAVORITE_ICON_BTN_HEIGHT,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle),
                      width: FAVORITE_ICON_BTN_WIDTH,
                      child: IconButton(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          onPressed: null,
                          icon: Icon(
                            Icons.favorite_border,
                            color: Theme.of(context).primaryColor,
                          ))))
            ],
          )),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.info?.name ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text("\$ ${data?.info?.price.toString()}",
              style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
