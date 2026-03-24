import 'package:flutter/material.dart';
import 'package:islamy_app/ui/home/custom_bottomNavBar.dart';
import 'package:islamy_app/ui/home/tabs/hadith/hadith_tab.dart';
import 'package:islamy_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islamy_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islamy_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islamy_app/ui/home/tabs/time/time_tab.dart';
import 'package:islamy_app/utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List <String> backgroundimages=[
    AppAssets.quranbg,
    AppAssets.hadithbg,
    AppAssets.sebhabg,
    AppAssets.radiobg,
    AppAssets.timebg,
  ];
  List<Widget> TabsList=[
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundimages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/Logo.png'),
              Expanded(
                child: TabsList[selectedIndex],
              ),
            ],
          ),
        )
      ],
    );
  }
}
