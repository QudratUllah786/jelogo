import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/auth/forgetpassword/forget_password.dart';
import 'package:jelogo/view/auth/pin_screen.dart';
import 'package:jelogo/view/auth/sign_up.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../bottombar/jelogo_bottom_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                     //   height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white, // White background
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
                
                    /// Email Field
                
                    MyTextField(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,

                    ),
                    // MyTextField(
                    //   // labelText: 'Email/Phone Number',
                    //   hintText: 'Password',
                    //   isObSecure: true,
                    //   haveSuffix: true,
                    //   suffixIcon: Icon(
                    //     Icons.remove_red_eye_outlined,
                    //     size: 20.sp,
                    //   ),
                    // ),
                
                    // SizedBox(height: 10.h),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: MyText(
                    //     onTap: (){
                    //
                    //       Get.to(()=> ForgetPassword());
                    //     },
                    //     text: "Forgot your password?",
                    //     size: 14,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                
                    SizedBox(height: 20.h),
                
                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {

                          Get.to(()=> PinScreen());

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kLoginButtonColor,
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
                
                    // SizedBox(height: 100.h,),
                    //
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //
                    //     MyText(text: 'Don\'t have an account? ',color: Color(0xff343434),),
                    //     SizedBox(width: 10.w,),
                    //     MyText(text: 'Sign up', color: kSecondaryColor,weight: FontWeight.w600,onTap: (){
                    //       Get.to(()=>SignUp());
                    //
                    //     },),
                    //
                    //   ],
                    // )
                
                
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
