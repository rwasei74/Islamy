import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_routes.dart';
import 'package:islamy_app/utils/app_style.dart';
/*
container width =238, hight=150
screen width =430, hight=932
* */

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement responsive ui
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style : const TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  AppAssets.prefixicon,
                 ),
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16white,
            ),
          ),
          MostRecentWidget(),
          Text('Sura List',
            style: AppStyle.bold16white,
          ),
          Expanded(child: 
          ListView.separated(
    itemBuilder: (context,index){
      return InkWell(
          onTap: () {
            //todo: navigate to SuraDetailsScreen
            Navigator.of(context).pushNamed(AppRoutes.SuraDetailsName,
            arguments: index)
            ;

          } ,
          child: SuraItemWidget(index: index));
    },
    separatorBuilder: (Context,index){
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: height*0.01,),
        child: Divider(
          thickness: 2,
          color: AppColors.whiteColor,
          indent: width*0.06,
          endIndent: width*0.06 ,
        ),
      );
    },
    itemCount: 114
    )
          )

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
}
