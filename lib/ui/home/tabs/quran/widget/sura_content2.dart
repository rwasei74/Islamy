import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';

class SuraContent2 extends StatelessWidget {
  final String content;


  SuraContent2({super.key, required this.content});

  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Text(content,
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
    style: AppStyle.bold20primary,);
  }
}
