import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/most_recent_widget.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_routes.dart';
import 'package:islamy_app/utils/app_style.dart';
import 'package:islamy_app/utils/shared_prefs_utils.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          TextField(
            style: const TextStyle(color: AppColors.whiteColor),
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
          ),
          MostRecentWidget(key: UniqueKey()),
          Text('Sura List', style: AppStyle.bold16white),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    saveSuraIndex(index);

                    await Navigator.of(context).pushNamed(
                      AppRoutes.SuraDetails2Name,
                      arguments: index,
                    );
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: SuraItemWidget(
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: AppColors.whiteColor,
                thickness: 1,
                indent: width * 0.1,
                endIndent: width * 0.1,
              ),
              itemCount: QuranResorces.arabicAuranSuraslist.length,
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
}
