import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_app/utils/app_assets.dart';
import 'package:islamy_app/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).bottomNavigationBarTheme;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        items: [
          _builtItem(
            index: 0,
            iconPath: AppAssets.quran,
            label: 'Quran',
            theme: theme,
          ),
          _builtItem(
            index: 1,
            iconPath: AppAssets.hadith,
            label: 'Hadith',
            theme: theme,
          ),
          _builtItem(
            index: 2,
            iconPath: AppAssets.sebha,
            label: 'Sebha',
            theme: theme,
          ),
          _builtItem(
            index: 3,
            iconPath: AppAssets.radio,
            label: 'Radio',
            theme: theme,
          ),
          _builtItem(
            index: 4,
            iconPath: AppAssets.time,
            label: 'Time',
            theme: theme,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _builtItem({
    required int index,
    required String iconPath,
    required String label,
    required BottomNavigationBarThemeData theme,
  }) {
    return BottomNavigationBarItem(
      icon: _bottomNavBarIcon(index: index, iconPath: iconPath, theme: theme),
      label: label,
    );
  }

  Widget _bottomNavBarIcon({
    required int index,
    required String iconPath,
    required BottomNavigationBarThemeData theme,
  }) {
    return selectedIndex == index
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackbgColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                theme.selectedItemColor ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          )
        : SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              theme.unselectedItemColor ?? Colors.black,
              BlendMode.srcIn,
            ),
          );
  }
}
