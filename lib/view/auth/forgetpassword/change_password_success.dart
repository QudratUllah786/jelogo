import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/auth/sign_in.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
class ChangePasswordSuccess extends StatelessWidget {
  final bool fromTransfer;
  const ChangePasswordSuccess({super.key, this.fromTransfer = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GeneralImageWidget(
              imagePath: AssetsImages.changePassImage,
            ),
            SizedBox(height: 30,),

            MyText(text: 'Change password successfully!',color: kSecondaryColor,
            weight: FontWeight.w600,
            ),

            SizedBox(height: 30,),

            BlueButton(ButtonText: 'Ok', onTap: (){

              if(fromTransfer){

                Get.close(5);
                return;
              }

              Get.offAll(()=> SignIn());

            })


          ],
        ),
      ),
    );
  }
}
