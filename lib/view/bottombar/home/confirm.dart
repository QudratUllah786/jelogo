import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/bottombar/home/home.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Confirm'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GeneralImageWidget(
              imagePath: AssetsImages.transferConfirm,
            ),
            SizedBox(
              height: 20.h,
            ),
            MyText(
              text: 'Transfer successful!',
              size: 16.sp,
              weight: FontWeight.w600,
              color: kSecondaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            MyText(
              text: 'You have successfully transferred',
              size: 14.sp,
              weight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Fcfa 1,000 ',
                  size: 14.sp,
                  weight: FontWeight.w700,
                  color: Color(0xffFF4267),
                ),
                MyText(
                  text: 'to ',
                  size: 14.sp,
                  weight: FontWeight.w500,
                ),
                MyText(
                  text: 'Amanda',
                  size: 14.sp,
                  weight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            BlueButton(
              ButtonText: 'Done',
              onTap: () {
                Get.close(3);
              },
            )
          ],
        ),
      ),
    );
  }
}
