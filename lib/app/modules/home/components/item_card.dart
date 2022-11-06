import 'package:bs_commerce/app/data/product/model/product_catelog_response.dart';
import 'package:flutter/material.dart';

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
              borderRadius: BorderRadius.circular(product_card_radius)),
          child: Stack(
            children: [
              Image.network(
                data?.photos?.first.url ?? "",
                height: product_card_width,
              ),
              Positioned(
                  top: 5,
                  left: card_left_position_padding,
                  right: 5,
                  child: Container(
                      height: favorite_icon_btn_height,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle),
                      width: favorite_icon_btn_width,
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
