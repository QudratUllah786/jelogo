import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/app_Colors.dart';

class UploadButton extends StatelessWidget {
  final String title;
  final File? imagePath; // Nullable image path
  final Color titleColor;
  final Color backgroundColor;
  final Color iconColor;
  final double width;
  final double height;
  final double iconSize;
  final VoidCallback onTap; // Tap callback

  const UploadButton({
    Key? key,
    required this.title,
    this.imagePath, // Optional image path
    this.titleColor = kSubheadingColor,
    this.backgroundColor = kPrimaryColor,
    this.iconColor = Colors.white,
    this.width = 151,
    this.height = 170,
    this.iconSize = 30,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16.sp),
            ),
            width: width.w,
            height: height.h,
            child: (imagePath != null && imagePath!.path.isNotEmpty)
                ? ClipRRect(
              borderRadius: BorderRadius.circular(16.sp),
              child: Image.file(
                imagePath!,
                width: width.w,
                height: height.h,
                fit: BoxFit.cover,
              ),
            )
                : Container(
              width: 60.w,
              height: 60.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffF2F1F9),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: iconColor, size: iconSize),
            ),
          ),
        ),
      ],
    );
  }
}
