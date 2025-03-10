import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_Colors.dart';
import '../constants/app_fonts.dart';
import 'my_text.dart';
class BlueButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onTap;
  final Color? shadowColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final Color? borderColor;
  final Color? textColor;
  const BlueButton(
      {super.key,
        required this.ButtonText,
        required this.onTap,
        this.shadowColor,
        this.backgroundColor, this.width, this.height, this.radius, this.fontSize, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow>? boxShadow = shadowColor != null
        ? [
      BoxShadow(
        color: shadowColor!,
        blurRadius: 6.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 3.0),
      ),
    ]
        : [];

    return  InkWell(
      onTap: onTap,
      child: Container(
          width: width??double.infinity,
          height:height?? 44.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius?? 15.sp),
            color: backgroundColor ?? kSecondaryColor,
            border: Border.all(color:borderColor?? kbuttonBorder),
            boxShadow: boxShadow,
          ),
          child: Center(
            child: MyText(
              text: ButtonText,
              color:textColor?? kPrimaryColor,
              fontFamily: AppFonts.POPPINS,
              size: fontSize??16.sp,
              weight: FontWeight.w500,
              lineHeight: 2.sp,
            ),
          ),
        ),
    );

  }
}