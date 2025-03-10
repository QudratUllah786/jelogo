import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/view/auth/forgetpassword/type_code.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(title:'Forgot password'),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: ListView(
          children: [

            Container(
              padding: AppSizes.DEFAULT,
              height: Get.height*0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kSecondaryColor.withValues(alpha: 0.1), // Soft shadow
                      blurRadius: 10, // Spread of the shadow
                      offset: Offset(2, 2), // Shadow position (X, Y)
                    ),
                  ],
                borderRadius: BorderRadius.circular(16.0),
                color: Color(0xffFFFFFF)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: 'Type your phone number ',size: 12.sp,
                  weight: FontWeight.w600,color: kSubheadingColor,),

                  SizedBox(height: 10.h,),

                  MyTextField(
                    hintText: '(+1)',
                     keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10.h,),


                  MyText(text: 'We texted you a code to verify your \n phone number',weight: FontWeight.w500,),

                  SizedBox(height: 15.h,),


                  BlueButton(ButtonText: 'Send', onTap: (){
                    Get.to(()=> TypeCode());

                  })


                ],
              ),
            )



          ],
        ),
      ),

    );
  }
}
