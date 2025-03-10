import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/custom_dropdown.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/upload_button.dart';
class AddId extends StatelessWidget {
  const AddId({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(
        title: 'Welcome to the app. Jelogo!',
        titleSize: 20.sp
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(child: MyText(text: 'ID Verification',size: 16.sp,weight: FontWeight.w600,)),

            SizedBox(height: 20.h,),

            CustomDropdown(title: 'Choose your Id', items: [
              'CNI',
              'Passport',
              'Consular Card',
              'Driver’s License',
              'Others',
              'Certificate of Identity'
            ]),

            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UploadButton(title: 'Photo CNI Front', onTap: () {  },

                ),
                UploadButton(title: 'Photo CNI Back', onTap: () {  },

                ),
              ],
            ),
            SizedBox(height: 20.h,),
            UploadButton(title: 'Upload Your Picture', onTap: () {  },

            ),
            
        Spacer(),
            
            BlueButton(ButtonText: 'Add a Credit Card', onTap: () {

            },),

            SizedBox(height: 10,)


          ],
        ),
      ),

    );
  }
}
