import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_content.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';
class SuraDetails extends StatefulWidget {
   SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
   List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)?.settings.arguments as int;
    if(verses.isEmpty){
    loadSuraFile(index);}
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
          Expanded(child: verses.isEmpty
              ?
              Center(child:
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),)
              :
          ListView.separated(
              itemBuilder: (context,index){
                return SuraContent(content: verses[index],index: index,);
              }
              , separatorBuilder: (context,index){
                return SizedBox(height: height*0.02,);
          },
              itemCount: verses.length)),
          Image.asset(AppAssets.mosco)

        ],
      ),
    );
  }

  void loadSuraFile( int index)async{
    String content= await rootBundle.loadString('assets/files/quran/${index+1}.txt');
    List<String> lines= content.split('\n');
    verses=lines;
    Future.delayed(Duration(seconds:1 ),() =>  setState(() {
    }));

  }
}
