import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/widgets/my_text.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String referralCode;

  const NewsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.referralCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: title, size:  18.sp, weight: FontWeight.bold),
            SizedBox(height: 5.h),
            MyText(text:subtitle, size: 16.sp, weight: FontWeight.w600),
            SizedBox(height: 8.h),
            MyText(text:description, size: 14.sp, color: Colors.black54),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: "Referral Code:", size: 14.sp, weight: FontWeight.w500),
                Row(
                  children: [
                    MyText(text: referralCode, size: 16.sp, weight: FontWeight.bold),
                    SizedBox(width: 8.w),
                    IconButton(
                      icon: Icon(Icons.copy, size: 18.sp),
                      onPressed: () {
                        // Copy to clipboard logic
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
