import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';
class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: simpleAppBar(title: 'Change Language'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(

          children: [

            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                MyText(text: 'French',size: 20.sp,weight: FontWeight.w600,color: kSubheadingColor),
                Icon(Icons.toggle_off_outlined,size: 30.sp,color: kSubheadingColor),
              ],
            ),

            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                MyText(text: 'English',size: 20.sp,weight: FontWeight.w600,color: kSubheadingColor,),
                Icon(Icons.toggle_off_outlined,size: 30.sp,color: kSubheadingColor),
              ],
            ),

            Spacer(),

            BlueButton(ButtonText:'Update', onTap: () {

            },),


            SizedBox(height: 40.h,),

          ],
        ),
      ),

    );
  }
}
