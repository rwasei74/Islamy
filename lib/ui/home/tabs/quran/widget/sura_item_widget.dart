import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_style.dart';
class SuraItemWidget extends StatelessWidget {
  int index;
   SuraItemWidget({super.key
  , required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      spacing: width*0.06,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index+1}',
            style: AppStyle.bold16white)
          ],
        ),
        Column(
         // spacing: height*0.01,
          children: [
            Text(QuranResorces.englishQuranSurahslist[index],
            style: AppStyle.bold20white,),
            Text('${QuranResorces.versesNumberlist[index]}verses',
              style: AppStyle.bold20white,)
          ],
        ),
        Spacer(),
        Text(QuranResorces.arabicAuranSuraslist[index],
          style: AppStyle.bold20white,),

      ],
    ) ;
  }
}
