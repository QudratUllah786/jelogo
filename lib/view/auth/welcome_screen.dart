import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/bottombar/jelogo_bottom_bar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../core/binding/app_binding.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          children: [

            SizedBox(height: 50.h,),

            MyText(text: 'Welcome to JELOGO your registration is complete',size: 20.sp,
            weight: FontWeight.w500,
              textAlign: TextAlign.center,

            ),

            SizedBox(height: 20.h,),
            Image.asset(AssetsImages.changePassImage),


            SizedBox(height: 50.h,),


            BlueButton(ButtonText: 'OK', onTap: () {
              Get.offAll(()=> JelogoBottomBar(),binding: BottomBarBindings());
            },)


          ],
        ),
      ),
    );
  }
}
