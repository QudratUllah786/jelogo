import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_fonts.dart';
import 'package:jelogo/view/auth/pin_screen.dart';

import '../../constants/app_Colors.dart';
import '../../constants/assets_images.dart';
import '../../widgets/appbar.dart';
import '../../widgets/general_image_widget.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_field_widget.dart';
import '../bottombar/jelogo_bottom_bar.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      resizeToAvoidBottomInset: true,
      appBar: simpleAppBar(
        titleSize: 16.0,
        bgColor: kSecondaryColor,
        title: 'Sign up',
        titleColor: kPrimaryColor,
        leadingIconSize: 14.sp,

        leadingColor: kPrimaryColor,


      ),
      body: Column(
        //shrinkWrap: true,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
            //  height: MediaQuery.of(context).size.height * 0.9,
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
                      text: 'Welcome to us',
                      weight: FontWeight.bold,
                      size: 24.sp,
                      color: kSecondaryColor,
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {},
                      child: MyText(
                        text: 'Hello there, create new account',
                        size: 14.sp,
                        color: Color(0xff343434),
                      ),
                    ),
                    SizedBox(height: 30.h),
                            
                    Center(
                      child: GeneralImageWidget(
                        imagePath: AssetsImages.signupImage,
                      ),
                    ),
                            
                    SizedBox(height: 20.h),
                            
                    /// Email Field
                            
                    MyTextField(
                      hintText: 'Name',
                    ),
                            
                    MyTextField(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    MyTextField(
                      // labelText: 'Email/Phone Number',
                      hintText: 'Password',
                      isObSecure: true,
                      haveSuffix: true,
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 20.sp,
                      ),
                    ),
                            
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                            
                        IconButton(
                            onPressed: (){
                          setState(() {
                            isCheck = !isCheck;
                          });
                        }, icon: Icon(isCheck == true? Icons.check_box_outlined:Icons.check_box_outline_blank, color:isCheck == true? kSecondaryColor:kTertiaryColor,)),
                            
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text:  TextSpan(
                              text: "By creating an account you agree to our ",
                              style: TextStyle(color: kTertiaryColor, fontSize: 14,fontFamily:AppFonts.POPPINS ),
                              children: [
                                TextSpan(
                                  text: "Term and Conditions",
                                  style: TextStyle(
                                    fontFamily:AppFonts.POPPINS,
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                            
                            
                            
                            
                            
                     /*   MyText(
                          maxLines: 2,
                          text: "By creating an account your aggree \n to our",
                          size: 14,
                          color: Colors.grey,
                        ),
                            
                        MyText(
                      //    maxLines: 2,
                          text: "Term and Condtions",
                          size: 14,
                          color: Colors.grey,
                        ),*/
                      ],
                    ),
                            
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
                          backgroundColor: Color(0xff0ffF2F1F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: MyText(
                          text: "Sign up",
                          color: kPrimaryColor,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                      ),
                    ),
                            
                    SizedBox(height: 20.h,),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            
                        MyText(text: 'Have an account? ',color: Color(0xff343434),),
                        SizedBox(width: 10.w,),
                        MyText(text: 'Sign in', color: kSecondaryColor,weight: FontWeight.w600,onTap: (){
                            
                          Get.back();
                            
                        },),
                            
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
