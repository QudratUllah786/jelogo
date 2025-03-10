import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_Colors.dart';
import '../constants/app_fonts.dart';
import 'my_text.dart';

AppBar simpleAppBar({
  String? title = '',
  IconData? leadingIcon,
  Color? bgColor,
  titleColor,leadingColor,
  List<Widget>? actions,
  VoidCallback? onLeadingTap,
  double? leadingIconSize = 24,
  double? titleSize = 24,
  double? paddingLeft = 0,
  bool? centerTitle = false,
  bool? haveLeading = true,
  String? trailingIcon,
}) {
  return AppBar(

    foregroundColor: kPrimaryColor,
    scrolledUnderElevation: 0,
    backgroundColor: bgColor,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    leading: haveLeading!
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: onLeadingTap ?? () => Get.back(),
            child: Icon(
              Icons.navigate_before,
              color: leadingColor ?? kTertiaryColor,
            ),
          ),
        ),
      ],
    )
        : null,
    title: MyText(
      paddingLeft: paddingLeft,
      text: title!,
      size: titleSize?? 19.sp,
      color: titleColor ?? kTertiaryColor,
      weight: FontWeight.w600,
      fontFamily: AppFonts.POPPINS,
      letterSpacing: 0.3,
    ),
    actions: actions,
  );
}