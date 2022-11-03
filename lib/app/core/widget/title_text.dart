import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleTextLarge extends StatelessWidget {
  final String text;
  const TitleTextLarge({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.titleMedium,);
  }
}
