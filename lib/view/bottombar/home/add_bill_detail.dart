import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/view/bottombar/home/invoice-payment/invoice_payment.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';
class AddBillDetail extends StatelessWidget {
  final String title;
  final Color bgColor;
  const AddBillDetail({super.key,required this.bgColor,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:simpleAppBar(
        haveLeading: false,
        title: title,
        centerTitle: true,
        bgColor: bgColor,
        titleColor:  Colors.white
      ),

      body: PopScope(
        canPop: false, // Prevent default back behavior
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.close(2); // Close two screens when back button is pressed
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              MyText(text: 'Numero identifiant ${title}',color: kSubheadingColor,size: 16.sp,weight: FontWeight.w600,),

              SizedBox(height: 10.h,),

              MyTextField(hintText: 'xxxxxxxxx',),

              BlueButton(ButtonText: 'Confirm', onTap: () {

                Get.close(2);
              },
              backgroundColor: Colors.blueAccent,)
            ],
          ),
        ),
      ),


    );
  }
}
