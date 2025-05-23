import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../constants/app_Colors.dart';
import '../../../constants/assets_images.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/general_image_widget.dart';

class TransactionDetail extends StatelessWidget {
  final bool isPositive;

  const TransactionDetail({super.key, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Transaction Detail'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kLoginButtonColor, // Background color for the icon
                    borderRadius: BorderRadius.circular(
                        12.sp), // Responsive border radius
                  ),
                  alignment: Alignment.center,
                  width: 50.w,
                  // Responsive width
                  height: 50.h,
                  // Responsive height
                  child: GeneralImageWidget(
                    width: 38.w,
                    height: 12.h,
                    imagePath: AssetsImages.logo,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: isPositive ? Colors.green : Color(0xffDC3F2A),
                      // Background color for the icon
                      borderRadius: BorderRadius.circular(
                          12.sp), // Responsive border radius
                    ),
                    alignment: Alignment.center,
                    width: 100.w,
                    // Responsive width
                    height: 44.h,
                    // Responsive height
                    child: MyText(
                      text: isPositive ? 'Success' : 'Failed',
                      size: 16.sp,
                      weight: FontWeight.w500,
                      color: kPrimaryColor,
                    )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor.withValues(alpha: 0.1),
                      // Soft shadow
                      blurRadius: 10,
                      // Spread of the shadow
                      offset: Offset(2, 2), // Shadow position (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xffFFFFFF),
                ),
                // width: 100.w, // Responsive width
                height: 76.h,
                // Responsive height
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: 'Transaction Date',
                        size: 16.sp,
                        weight: FontWeight.w600),
                    MyText(
                        text: '10/01/2025  22:20',
                        size: 12.sp,
                        weight: FontWeight.w400),
                  ],
                )),
            SizedBox(
              height: 10.h,
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor.withValues(alpha: 0.1),
                      // Soft shadow
                      blurRadius: 10,
                      // Spread of the shadow
                      offset: Offset(2, 2), // Shadow position (X, Y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xffFFFFFF),
                ),
                // width: 100.w, // Responsive width
                height: 364.h,
                // Responsive height
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    MyText(
                        text: 'Transaction Type',
                        size: 16.sp,
                        weight: FontWeight.w600),
                    MyText(
                        text: 'Money Transfer',
                        size: 12.sp,
                        weight: FontWeight.w400),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyText(
                        text: 'Sender', size: 16.sp, weight: FontWeight.w600),
                    MyText(
                        text: '12222333545555',
                        size: 12.sp,
                        weight: FontWeight.w400),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyText(
                        text: 'Amount Received',
                        size: 16.sp,
                        weight: FontWeight.w600),
                    MyText(
                        text: '50 FCFA', size: 12.sp, weight: FontWeight.w400),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyText(
                        text: 'Transaction Fee',
                        size: 16.sp,
                        weight: FontWeight.w600),
                    MyText(
                        text: '5.1 FCFA', size: 12.sp, weight: FontWeight.w400),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyText(
                        text: 'Transaction ID',
                        size: 16.sp,
                        weight: FontWeight.w600),
                    MyText(
                        text: 'CMy455533DEFESLA567899',
                        size: 12.sp,
                        weight: FontWeight.w400),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
