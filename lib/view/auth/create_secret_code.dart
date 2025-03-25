import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/view/auth/forgetpassword/change_password_success.dart';
import 'package:jelogo/view/auth/personal_information.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../constants/app_Colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/my_text.dart';
class CreateSecretCode extends StatelessWidget {
  const CreateSecretCode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(title:'Create Secret Code',
      centerTitle: true,
        haveLeading: false
      ),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: ListView(
          children: [

            Container(
              padding: AppSizes.DEFAULT,
              height: Get.height*0.4,
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
                    hintText: '***********',
                    isObSecure: true,
                    haveSuffix: true,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.sp,
                    ),
                    labelText: 'please create a secret code',

                  ),
                  MyTextField(
                    hintText: '***********',
                    isObSecure: true,
                    haveSuffix: true,
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20.sp,
                    ),
                    labelText: 'please confirm',
                  ),


                  SizedBox(height: 20.h,),
                  BlueButton(ButtonText: 'OK', onTap: (){


                    Get.to(()=> PersonalInformation());

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
