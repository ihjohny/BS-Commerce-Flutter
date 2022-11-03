import 'package:bs_commerce/app/core/widget/medium_text.dart';
import 'package:bs_commerce/app/core/widget/title_text.dart';
import 'package:bs_commerce/app/data/product/model/product_catelog_response.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Data? data;

  const ProductCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = 120.0;
    var cardRadius = 20.0;

    return ListTile(
      title: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(cardRadius)),
          child: Image.network(
            data?.photos?.first.url ?? "",
            height: width,
          )),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextLarge(
            text: data?.info?.name ?? "",
          ),
          TitleTextMedium(text: "\$ ${data?.info?.price.toString()}"),
        ],
      ),
    );
  }
}
