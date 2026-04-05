import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_style.dart';
class HadethTextWidjet extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const HadethTextWidjet({super.key,required this.text,required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
