import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/bottombar/card/add_id.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../constants/app_Colors.dart';
class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: simpleAppBar(
        haveLeading: false,
        paddingLeft: 23.sp,
        title: 'Good Evening Mr. Lorem',
            titleSize: 20.sp
      ),
      body: Column(
        children: [



          // GeneralImageWidget(
          //   imagePath: AssetsImages.card,
          // ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [


                Container(
                  width: Get.width,
                  height: Get.height*0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    boxShadow: [
                      BoxShadow(
                        color: kSecondaryColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: IconButton(onPressed: () {

                  }, icon: Icon(Icons.add,size: 50.sp,color: kSubheadingColor,)),
                ),


                SizedBox(height: 30.h,),

                MyText(text: 'You don’t have a registered credit card',size: 16.sp,
                weight: FontWeight.w600,
                ),
                MyText(
                  textAlign: TextAlign.center,
                  text: 'Add a credit card to make online\n payments',size: 16.sp,
                  weight: FontWeight.w400,
                ),

                SizedBox(height: 150.h,),

                BlueButton(ButtonText: 'Add a Credit Card', onTap: () {
                  Get.to(()=>AddId() );
                },)
              ],
            ),
          ),





        ],
      ),
    );



  }
}
