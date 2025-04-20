import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/view/auth/forgetpassword/change_password_success.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../constants/app_Colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../utils/validators.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/my_text.dart';
class ChangePassword extends StatelessWidget {
   ChangePassword({super.key, this.fromTransfer = false});
  final authController = Get.find<AuthController>();
   final _formKey = GlobalKey<FormState>();
   final bool fromTransfer;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(title:'Change password'),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: Form(
          key: _formKey,
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
                child: Obx(
                  () =>  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        controller: authController.forgotSecretCodeController,
                        validator: (v)=> ValidationService.instance.validatePassword(v),
                        keyboardType: TextInputType.number,
                        hintText: '***********',
                        isObSecure: authController.passVisible.value,
                        haveSuffix: true,
                        onSuffixTap: () {
                          authController.passVisible.value = !authController.passVisible.value;
                        },
                        suffixIcon: Icon(
                          authController.passVisible.value?Icons.visibility_outlined :   Icons.visibility_off_outlined,
                          size: 20.sp,
                        ),
                        labelText: 'New Password',

                      ),
                      MyTextField(
                        hintText: '***********',
                        controller: authController.forgotConfSecretCodeController,
                        keyboardType: TextInputType.number,
                        validator: (v)=> ValidationService.instance.validateMatchPassword(v!,authController.forgotSecretCodeController.text.trim()),
                        isObSecure: authController.confPassVisible.value,
                        haveSuffix: true,
                        onSuffixTap: () {
                          authController.confPassVisible.value = !authController.confPassVisible.value;
                        },
                        suffixIcon: Icon(
                          authController.confPassVisible.value?Icons.visibility_outlined :   Icons.visibility_off_outlined,
                          size: 20.sp,
                        ),
                        labelText: 'Confirm New Password',
                      ),

                      SizedBox(height: 20.h,),
                      BlueButton(ButtonText: 'Change password', onTap: () async {
                        if(!_formKey.currentState!.validate()){
                          return;
                        }

                       await authController.resetPassword(fromTransfer: fromTransfer);



                      })


                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      ),

    );
  }
}
