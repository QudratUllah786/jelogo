import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';

import '../../../constants/app_Colors.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/my_text_field_widget.dart';
class ScanSending extends StatelessWidget {
  const ScanSending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: simpleAppBar(
        title: 'Scan Sending',
        titleColor: kPrimaryColor,
        leadingColor: kPrimaryColor,
        bgColor: kSecondaryColor
      ),
      body: Column(
        children: [

         SizedBox(height: 50.h,),

          Expanded(
            child: Container(
            //  alignment: Alignment.center,
              width: double.infinity,
              //   height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    
                    MyText(text: 'Scan a QR Code',color: kSecondaryColor,
                    size: 16.sp,
                      weight: FontWeight.w600,
                    ),

                    SizedBox(height: 20.h,),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      alignment: Alignment.center,
                      width: 259.w,
                      height: 304.h,
                      decoration: BoxDecoration(
                        color: Color(0xffE9E9E9), // Background color for the icon
                        borderRadius: BorderRadius.circular(12.sp), // Responsive border radius
                      ),
                      child: Column(
                        children: [
                          MyText(text: 'Scan your QR',size: 26.sp,weight: FontWeight.w600,),

                          SizedBox(height: 20.h,),
                          GeneralImageWidget(
                            imagePath: AssetsImages.qrCode,
                          ),



                        ],
                      ),
                    ),

                    SizedBox(height: 20.h,),
                    MyText(text: 'Please, align QR Code within\n the frame to make scanning\n easily detectable.',
                    size: 16.sp,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w400,

                    )






                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
