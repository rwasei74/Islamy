import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';
class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height*0.02,
        children: [
          Text('Most Recently',
          style: AppStyle.bold16white,
              ),
    SizedBox(
    // 150/932
    height : height*0.16,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
    return

    Container(
    decoration: BoxDecoration(
    color: AppColors.primaryColor,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
    padding:  EdgeInsets.symmetric(
    horizontal: width*0.04 ,
    vertical: height*0.01,
    ),
    child: Row(
    spacing: width*0.02,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text('Al-Anbiya',
    style: AppStyle.bold24black,
    ),
    Text('الأنبياء' ,
    style: AppStyle.bold24black),
    Text('112 Verses ',
    style: AppStyle.bold14black,
    ),
    ],
    ),
    Image.asset(AppAssets.mostrecent)

    ],
    ),
    ),

    );
    },
    separatorBuilder: (BuildContext context, int index) {
    //spacing between cards
    return SizedBox(width: width*0.04,);
    },
    itemCount: 10 ,
    ),
    )
        ],
      ) ;

  }
}
