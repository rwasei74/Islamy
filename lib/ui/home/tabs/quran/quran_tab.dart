import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_routes.dart';
import 'package:islamy_app/utils/app_style.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
   List<int> filterlist = List.generate(114, (index) => index );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style:  TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppAssets.prefixicon),
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16white,
            ),
            onChanged: (text){
              searcBySuraName(text);
            },
          ),
          SizedBox(height: height * 0.015),
          const MostRecentWidget(),
          SizedBox(height: height * 0.015),
          Text('Sura List', style: AppStyle.bold16white),
          SizedBox(height: height * 0.015),
          Expanded(child: filterlist.isEmpty?
    Center(child:Text('No Sura Item Found',
          style: AppStyle.bold20primary,))
    :
             ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.SuraDetails2Name,
                      arguments: filterlist[index],
                    );
                  },
                  child: SuraItemWidget(
                    index: filterlist[index],
                  ),
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(3),
                child: Divider(
                  color: AppColors.whiteColor,
                  thickness: 1,
                  indent: width * 0.1,
                  endIndent: width * 0.1,
                ),
              ),
              itemCount: filterlist.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  void searcBySuraName(String text){
    List<int> searchResultList=[];
    for(int i=0;i<QuranResorces.arabicAuranSuraslist.length;i++){
      //todo: tolowercase() => Saba => Saba, SABA => Saba
      //todo: toUpperCase() => Saba => SABA, sABA => SABA
      if(QuranResorces.englishQuranSurahslist[i].toLowerCase().contains(text.toLowerCase())){
        searchResultList.add(i);
      }
    if(QuranResorces.arabicAuranSuraslist[i].contains(text)){
      searchResultList.add(i);
    }
    }
    filterlist=searchResultList;
    setState(() {
    });

  }
}
