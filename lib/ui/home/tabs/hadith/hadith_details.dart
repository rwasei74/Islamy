 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/model/hadeth.dart';
import 'package:islamy_app/ui/home/tabs/hadith/hadeth_text_widjet.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';
class HadithDetails extends StatefulWidget {
  final int index;
 HadithDetails({super.key,required this.index});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  Hadeth ?hadeth;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadhadithfile();
  }
  @override
  Widget build(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(image: AssetImage(
          AppAssets.hadethbg
        ))
      ),
      child: hadeth== null ?
      Center(child: CircularProgressIndicator(
        color: AppColors.blackbgColor,
      ),)
          :Column(
                  children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width*0.04,
                vertical: height*0.01
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.hadethleft,
                width: width*0.16,
                ),
                Expanded(
                  child: HadethTextWidjet(text: hadeth?.title??'',
                    textStyle: AppStyle.bold20blackhadith,
                  ),),
                Image.asset(AppAssets.hadethright,
                  width: width*0.16,
                ),


              ],
            ),
          ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width*0.04,
                            
                  ),
                  child: HadethTextWidjet(text: hadeth?.content??'',
                  textStyle: AppStyle.bold16black,
                ),
                ),
              ),
            ),

          Image.asset(AppAssets.hadethbottom,
          ),
                  ],
                )
    );
  }

  void loadhadithfile()async{
   String hadethcontent= await rootBundle.loadString('assets/files/hadeeth/h${widget.index}.txt');
   int filehadethcontentindex=hadethcontent.indexOf('\n');
   String title=hadethcontent.substring(0,filehadethcontentindex);
    String content=hadethcontent.substring(filehadethcontentindex+1);
     hadeth=Hadeth(content: content, title: title);
     Future.delayed(Duration(seconds: 1),()=>
     setState(() {
     }),);
  }
}
