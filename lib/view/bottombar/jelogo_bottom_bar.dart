import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/view/bottombar/card/credit_card.dart';
import 'package:jelogo/view/bottombar/home/home.dart';
import 'package:jelogo/view/bottombar/settings/settings.dart';

import '../../constants/app_fonts.dart';
import '../../constants/assets_images.dart';
import '../../widgets/my_text.dart';

class JelogoBottomBar extends StatefulWidget {
  const JelogoBottomBar({super.key});

  @override
  _JelogoBottomBarState createState() => _JelogoBottomBarState();
}

class _JelogoBottomBarState extends State<JelogoBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    CreditCard(),
    Settings(),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withValues(alpha: 0.1), // Soft shadow
              blurRadius: 10, // Spread of the shadow
               offset: Offset(2, 2), // Shadow position (X, Y)
            ),
          ],

          color: Colors.white, // Background color of the navbar
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navBarItem(
              iconPath: AssetsImages.homeIcon,
              label: 'Home',
              index: 0,
            ),
            navBarItem(
              iconPath: AssetsImages.creditCard,
              label: 'Card',
              index: 1,
            ),
            navBarItem(
              iconPath: AssetsImages.settings,
              label: 'Settings',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget navBarItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: isSelected
            ? BoxDecoration(
          color: kSecondaryColor, // Selected item background color
          borderRadius: BorderRadius.circular(25.sp),
        )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              color: isSelected ? Colors.white : Colors.grey,
              width: 24.w,
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              MyText(
                text: label,
                color: Colors.white,
                size: 14.sp,
                fontFamily: AppFonts.POPPINS,
                weight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
