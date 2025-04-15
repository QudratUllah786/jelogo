import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/utils/snackbars.dart';
import 'package:jelogo/view/auth/forgetpassword/type_code.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_phone_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();
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
              height: Get.height*0.33,
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

                 MyPhoneTextField(formKey: _formKey,
                 controller: _authController.forgetPassPhone,
                   onCountryChanged: (p0) {
                     _authController.forgotPassCountryCode.value = p0.dialCode;
                   },
                 ),

                  SizedBox(height: 10.h,),


                  MyText(text: 'We texted you a code to verify your \n phone number',weight: FontWeight.w500,),

                  SizedBox(height: 15.h,),


                  BlueButton(ButtonText: 'Send', onTap: () async {

                    if(_authController.forgetPassPhone.text.isEmpty)
                    {
                      CustomSnackBars.instance.showToast(message: 'please add phone no');
                      return;
                    }
                   await _authController.sendForgotPassOtp();

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
