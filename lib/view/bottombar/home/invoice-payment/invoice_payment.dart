import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/view/bottombar/home/invoice-payment/transport.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';

import '../../../../widgets/my_text.dart';
class InvoicePayment extends StatelessWidget {
  const InvoicePayment({super.key});

  static  List<Map<String,dynamic>> serviceList = [{
    'title':'Merchants',
    'image':AssetsImages.accountDetail,
    "route": () {},


   },
    {
    'title':'Transports',
    'image':AssetsImages.accountDetail,
      "route": () {
      Get.to(()=> Transport());
      },
    },
    {
      'title':'Bills',
      'image':AssetsImages.accountDetail,
      "route": () {},

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Invoice Payments'),
      body: Padding(  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(text: 'Invoice Payments & Services',size: 20.sp,weight: FontWeight.w600,),

          SizedBox(height: 20.h,),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable nested scrolling issues
            itemCount: serviceList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10, // Add spacing
              mainAxisSpacing: 10,  // Add spacing
              childAspectRatio: 0.75, // Adjust item height
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 200.h, // Constrain height
                child: InkWell(
                  onTap:  serviceList[index]['route'],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: serviceList[index]['title'],size: 16.sp,weight: FontWeight.w600     ,),
                      const SizedBox(height: 5), // Add spacing
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Apply rounded corners
                        child: GeneralImageWidget(
                          imagePath: serviceList[index]['image'],
                          width: 151.w,
                          height:170.h,
                          fit: BoxFit.cover, // Ensure proper image scaling
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )



        ],
      ),

      ),
    );
  }
}
