import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  SuraContent({super.key, required this.content, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isselected = !isselected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.02),
        decoration: BoxDecoration(
          color: isselected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        child: Text(
          "${widget.content} [${widget.index + 1}]",
          textAlign: TextAlign.center,
          style: isselected
              ? AppStyle.bold20primary.copyWith(color: AppColors.blackColor)
              : AppStyle.bold20primary,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
