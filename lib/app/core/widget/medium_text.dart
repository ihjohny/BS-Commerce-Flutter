import 'package:flutter/material.dart';

class TitleTextMedium extends StatelessWidget {
  final String text;
  const TitleTextMedium({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.titleSmall,);
  }
}
