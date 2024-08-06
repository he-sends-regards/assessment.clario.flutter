import 'package:flutter/material.dart';

import '../styles/colors.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;

  const HeadlineText(
    this.text, {
    Key? key,
    this.color,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: color ?? AppColors.titleText,
          ),
    );
  }
}
