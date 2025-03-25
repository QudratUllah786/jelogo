import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/view/auth/welcome_screen.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';
class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

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
          child: Column(
            children: [
          
              Row(
                children: [
          
                  MyText(text: 'M'),
                  SizedBox(width: 3.w,),
                  Icon(Icons.radio_button_checked_outlined,color: kSecondaryColor,),
          
                  SizedBox(width: 10.w,),
          
                  MyText(text: 'Mme'),
                  SizedBox(width: 3.w,),
                  Icon(Icons.radio_button_off,),
                  SizedBox(width: 10.w,),
          
                  MyText(text: 'Mile'),
                  SizedBox(width: 3.w,),
                  Icon(Icons.radio_button_off,),
                ],
              ),
              SizedBox(height: 10.h,),
              MyTextField(
                labelText: 'First Name',
              ),
          
              MyTextField(
                labelText: 'Last Name',
              ),
          
              MyTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
          
              MyTextField(
                labelText: 'Address',
              ),
          
              From_date(label: 'Date of birth'),


           SizedBox(height: 30.h,),

              BlueButton(ButtonText: 'Sign up', onTap: (){


                Get.to(()=> WelcomeScreen());

              },)
          
            ],
          ),
        ),
      ),


    );
  }
}
