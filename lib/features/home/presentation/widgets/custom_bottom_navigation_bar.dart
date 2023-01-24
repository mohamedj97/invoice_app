import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/font_assets.dart';
import '../../../../core/common_widgets/lw_custom_text.dart';
import '../../../../core/assets/colors.dart';
import '../../../../utils/static_const_data/bottom_nav_bar_items_date.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onChanged;
  final void Function()? onItemTapped;

  const CustomBottomNavigationBar(
      {Key? key,
      required this.pageIndex,
      required this.onChanged,
      this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bottomColor = AppColors.disabledBottomItemColor;
    return AnimatedBottomNavigationBar.builder(
      backgroundColor: AppColors.whiteColor,
      itemCount: 4,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      height: 60.0,
      tabBuilder: (int index, bool isActive) {
        bottomColor =
            isActive ? AppColors.primary : AppColors.disabledBottomItemColor;
        return InkWell(
          onTap: onItemTapped,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  height: isActive ? 22.0 : 20.0,
                  isActive
                      ? BottomAppBarItemsData.activeIconsList[index]
                      : BottomAppBarItemsData.disabledIconsList[index]),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LWCustomText(
                  title: BottomAppBarItemsData.labelList[index],
                  color: bottomColor,
                  fontSize: 10.0,
                  fontFamily: isActive
                      ? FontAssets.avertaSemiBold
                      : FontAssets.avertaRegular,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              )
            ],
          ),
        );
      },
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: onChanged,
    );
  }
}
