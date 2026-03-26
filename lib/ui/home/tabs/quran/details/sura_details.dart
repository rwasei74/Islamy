import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';
class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColors.blackkColor,
      appBar:AppBar(
        title:Text(QuranResorces.englishQuranSurahslist[index],
       style: AppStyle.bold20primary,) ,
      ) ,
      body: Column(
        spacing: height*0.02,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: width*0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.left),
                Text(QuranResorces.arabicAuranSuraslist[index],
                style: AppStyle.bold24primaty,),
                Image.asset(AppAssets.right),
              ],
            ),
          ),
          Expanded(child: Container(color: AppColors.primaryColor,)),
          Image.asset(AppAssets.mosco)
          
        ],
      ),
    );
  }
}
