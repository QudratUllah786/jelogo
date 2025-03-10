import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/view/auth/forgetpassword/change_password_success.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../constants/app_Colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/my_text.dart';
class SettingChangePassword extends StatelessWidget {
  const SettingChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(title:'Change password'),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: ListView(
          children: [

            SizedBox(height: 30.h,),

            Container(
              padding: AppSizes.DEFAULT,
              height: Get.height*0.45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kSecondaryColor.withValues(alpha: 0.1), // Soft shadow
                    blurRadius: 10, // Spread of the shadow
                    offset: Offset(2, 2), // Shadow position (X, Y)
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    hintText: 'Recent password',

                    isObSecure: true,
                    haveSuffix: true,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.sp,
                    ),
                    labelText: 'Recent password',

                  ),
                  MyTextField(
                    hintText: 'New password',
                    isObSecure: true,
                    haveSuffix: true,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.sp,
                    ),
                    labelText: 'New password',
                  ),

                  MyTextField(
                    hintText: 'Confirm password',
                    isObSecure: true,
                    haveSuffix: true,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.sp,
                    ),
                    labelText: 'Confirm password',
                  ),



                  SizedBox(height: 20.h,),
                  BlueButton(ButtonText: 'Change password', onTap: (){


                    Get.to(()=> ChangePasswordSuccess());

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
