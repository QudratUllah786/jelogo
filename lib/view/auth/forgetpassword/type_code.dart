import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/utils/snackbars.dart';
import 'package:jelogo/view/auth/forgetpassword/change_password.dart';
import 'package:jelogo/widgets/blue_button.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/my_text_field_widget.dart';

class TypeCode extends StatelessWidget {
  final authController = Get.find<AuthController>();
   TypeCode({super.key, this.fromTransfer = false});
   final bool fromTransfer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Forgot password'),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: ListView(
          children: [
            Container(
              padding: AppSizes.DEFAULT,
              height: Get.height * 0.4,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Type a code ',
                    size: 12.sp,
                    weight: FontWeight.w600,
                    color: kSubheadingColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: MyTextField(
                          hintText: 'Code',
                          controller: authController.forgotPassCodeCtrl,
                          keyboardType: TextInputType.number,

                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: BlueButton(
                            width: 100,
                            ButtonText: 'Resend',
                            onTap: () async {



                            await  authController.sendForgotPassOtp(resend: true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyText(
                    text: 'We texted you a code to verify your',
                    weight: FontWeight.w500,
                  ),
                  Obx(
                    () =>  Row(
                      children: [
                        MyText(
                          text: 'phone number',
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          text: '(+${authController.forgotPassCountryCode.value}) ${authController.forgetPassPhone.text}',
                          weight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyText(
                    text:
                        'This code will expired 10 minutes after this message. If you don\'t get a message.',
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlueButton(
                      ButtonText: 'Change password',
                      onTap: () {
                        if(authController.forgotPassCodeCtrl.text.isEmpty){
                          CustomSnackBars.instance.showToast(message: 'please type code');
                          return;
                        }





                        Get.to(() => ChangePassword(fromTransfer: fromTransfer,));
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
