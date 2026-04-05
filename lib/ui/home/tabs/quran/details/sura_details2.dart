import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/model/quran_resorces.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_content.dart';
import 'package:islamy_app/ui/home/tabs/quran/widget/sura_content2.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';
import 'package:islamy_app/utils/app_style.dart';

class SuraDetails2 extends StatefulWidget {
  const SuraDetails2({super.key});
  static const String routeName = 'sura_details2';

  @override
  State<SuraDetails2> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails2> {
  List<String> versesList = [];
  String versesString = '';
  bool isListViewMode = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)?.settings.arguments as int;

    if (versesList.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.blackkColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          QuranResorces.englishQuranSurahslist[index],
          style: AppStyle.bold20primary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListViewMode = !isListViewMode;
              });
            },
            icon: Icon(
              isListViewMode ? Icons.view_headline : Icons.view_agenda,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        spacing: height * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.left),
                Text(
                  QuranResorces.arabicAuranSuraslist[index],
                  style: AppStyle.bold24primaty,
                ),
                Image.asset(AppAssets.right),
              ],
            ),
          ),
          Expanded(
            child: versesList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : isListViewMode
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraContent(
                            content: versesList[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height * 0.02,
                          );
                        },
                        itemCount: versesList.length,
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SuraContent2(content: versesString),
                        ),
                      ),
          ),
          Image.asset(AppAssets.mosco),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> lines = content.trim().split('\n');

    // 1. القائمة لـ SuraContent
    versesList = lines;

    // 2. النص الكامل مع الأرقام لـ SuraContent2
    List<String> tempLines = [];
    for (int i = 0; i < lines.length; i++) {
      tempLines.add("${lines[i].trim()} [${i + 1}]");
    }
    versesString = tempLines.join(' ');

    setState(() {});
  }
}
