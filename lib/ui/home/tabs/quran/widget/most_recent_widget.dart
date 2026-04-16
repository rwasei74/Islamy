import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';
import 'package:islamy_app/utils/shared_prefs_utils.dart';
class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
   List<int> mostrecentlist=[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readMostRecentList();
  }
  void readMostRecentList()async{
     mostrecentlist=await getMostRecentList();
     setState(() {
     });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Visibility(
        visible: mostrecentlist.isNotEmpty
        ,child:
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
      crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text(QuranResorces.englishQuranSurahslist[mostrecentlist[index]] ,
    style: AppStyle.bold24black,
    ),
    Text(QuranResorces.arabicAuranSuraslist[mostrecentlist[index]] ,
    style: AppStyle.bold24black),
    Text('${QuranResorces.versesNumberlist[mostrecentlist[index]]} Verses ',
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
    itemCount: mostrecentlist.length,
    ),
    )
        ],
      )
    );

  }
}
