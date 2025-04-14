import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/utils/validators.dart';
import 'package:jelogo/view/auth/welcome_screen.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';
class PersonalInformation extends StatelessWidget {
   PersonalInformation({super.key});
   final authController = Get.find<AuthController>();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(
        title: 'Personal Information',
        haveLeading: false,
        centerTitle: true
      ),

      body: Padding(
        padding: AppSizes.DEFAULT,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Obx(
              () =>  Column(
                children: [

              Row(
              children: [
              MyText(text: 'MALE'),
              SizedBox(width: 3.w),
              Radio<String>(
                value: 'MALE',
                groupValue: authController.selectedGender.value,
                onChanged: (value) {

                  authController.selectedGender.value = value!;
                  log('gender:${authController.selectedGender.value}');

                },
                activeColor: kSecondaryColor,
              ),
              SizedBox(width: 10.w),

              MyText(text: 'FEMALE'),
              SizedBox(width: 3.w),
              Radio<String>(
                value: 'FEMALE',
                groupValue: authController.selectedGender.value,
                onChanged: (value) {
                  authController.selectedGender.value = value!;
                  log('gender:${authController.selectedGender.value}');
                },
              ),
              ],
                        ),
                  SizedBox(height: 10.h,),
                  MyTextField(
                    labelText: 'First Name',
                    controller: authController.fNameCtrl,
                    validator: (value) => ValidationService.instance.emptyValidator(value),
                  ),

                  MyTextField(
                    labelText: 'Last Name',
                    controller: authController.lNameCtrl,
                    validator: (value) => ValidationService.instance.emptyValidator(value),
                  ),

                  MyTextField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: authController.emailCtrl,
                    validator: (value) => ValidationService.instance.emailValidator(value),
                  ),

                  MyTextField(
                    labelText: 'Address',
                    controller: authController.addressCtrl,
                    validator: (value) => ValidationService.instance.emptyValidator(value),
                  ),

                  Obx(
                    () =>  From_date(label: 'Date of birth',
                    onDateSelected: (p0) {
                      authController.dob.value = p0;
                    },

                      selectedDate: authController.dob.value,
                    ),
                  ),


               SizedBox(height: 30.h,),

                  BlueButton(ButtonText: 'Sign up', onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                     await authController.createAccount();


                  },)

                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
