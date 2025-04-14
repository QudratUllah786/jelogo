import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/view/auth/forgetpassword/forget_password.dart';
import 'package:jelogo/view/auth/pin_screen.dart';
import 'package:jelogo/view/auth/sign_up.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../widgets/my_phone_widget.dart';
import '../bottombar/jelogo_bottom_bar.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _authController = Get.put(AuthController());
  // TextEditingController phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: simpleAppBar(
        paddingLeft: 22.sp,
        titleSize: 16.0,
        bgColor: kSecondaryColor,
        title: 'Sign in',
        titleColor: kPrimaryColor,
        haveLeading: false,
        leadingIconSize: 14.sp,
        leadingColor: kPrimaryColor,
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Welcome Back',
                      weight: FontWeight.bold,
                      size: 24.sp,
                      color: kSecondaryColor,
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {},
                      child: MyText(
                        text: 'Hello there, sign in to continue',
                        size: 14.sp,
                        color: Color(0xff343434),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    Center(
                      child: GeneralImageWidget(
                        imagePath: AssetsImages.authImage,
                      ),
                    ),

                    SizedBox(height: 20.h),


                      MyPhoneTextField(
                        controller: _authController.loginPhoneCtrl,
                        onChanged: (p0) {
                          _authController.update(['phone']);
                          _authController.validateForm(_formKey,_authController.loginPhoneCtrl,_authController.isFormValid);
                        },
                         onCountryChanged: (p0) {
                           _authController.signInCountryCode/**/.value = p0.dialCode;
                         },
                         formKey: _formKey,
                      ),


                    SizedBox(height: 20.h),

                    Obx(
                      () =>  SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: _authController.isFormValid.value ? () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(() => PinScreen());
                            }
                          } : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _authController.isFormValid.value ? kSecondaryColor : kLoginButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: MyText(
                            text: "Sign in",
                            color: kPrimaryColor,
                            weight: FontWeight.bold,
                            size: 16,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 100.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text: 'Don\'t have an account? ', color: Color(0xff343434)),
                        SizedBox(width: 10.w),
                        MyText(
                          text: 'Sign up',
                          color: kSecondaryColor,
                          weight: FontWeight.w600,
                          onTap: () {
                            Get.to(() => SignUp());
                          },
                        ),
                      ],
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