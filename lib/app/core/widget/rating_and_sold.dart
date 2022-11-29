import 'package:bs_commerce/app/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../values/app_values.dart';

class RatingAndSoldComponent extends StatelessWidget {
  final double ratings;
  final int soldValue;
  const RatingAndSoldComponent({
    Key? key,
    required this.ratings,
    required this.soldValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
           Material(
            color: Colors.white70,
            elevation: 1,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Padding(
                padding: EdgeInsets.all(8),
                child:Text("${soldValue.toString()} sold")),
          ),
          Space(width:AppValues.margin_20),
          const Icon(Icons.star_half_outlined),
          Text(ratings.toString(),style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
