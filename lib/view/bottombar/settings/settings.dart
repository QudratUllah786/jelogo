import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/core/binding/app_binding.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/view/bottombar/settings/change_language.dart';
import 'package:jelogo/view/bottombar/settings/personal_information.dart';
import 'package:jelogo/view/bottombar/settings/setting_change_password.dart';

import '../../../constants/app_Colors.dart';
import '../../../constants/assets_images.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/general_image_widget.dart';
import '../../../widgets/my_text.dart';

class Settings extends StatelessWidget {
   const Settings({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: simpleAppBar(
        haveLeading: false,
          paddingLeft: 22.sp,
          title: 'Setting',
          titleColor: kPrimaryColor,
          leadingColor: kPrimaryColor,
          bgColor: kSecondaryColor),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 90.h),


                      /* InkWell(
                         onTap: () {
                           Get.to(()=>SettingChangePassword());
                         },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             MyText(
                               text: 'Change Password',weight: FontWeight.w500,
                             size: 16.sp,
                             ),

                             Icon(Icons.navigate_next_outlined,color: Color(0xffE0E0E0),),

                           ],
                         ),
                       ),
                        Divider(
                          thickness: 0.5,
                        ),*/

                        SizedBox(height: 2.h,),

                        InkWell(
                          onTap: () {
                            Get.to(()=>PersonalInformation(),binding: ProfileBindings());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Personal Information',weight: FontWeight.w500,
                                size: 16.sp,
                              ),

                              Icon(Icons.navigate_next_outlined,color: Color(0xffE0E0E0),),

                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),

                        SizedBox(height: 2.h,),

                        InkWell(
                          onTap: () async {
                            Get.to(()=> PersonalInformation(isDocument: true,),binding: ProfileBindings());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Documents',weight: FontWeight.w500,
                                size: 16.sp,
                              ),

                              Icon(Icons.navigate_next_outlined,color: Color(0xffE0E0E0),),

                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),

                        SizedBox(height: 2.h,),

                        InkWell(
                          onTap: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Pricing Plan',weight: FontWeight.w500,
                                size: 16.sp,
                              ),

                              Icon(Icons.navigate_next_outlined,color: Color(0xffE0E0E0),),

                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        SizedBox(height: 2.h,),

                        InkWell(
                          onTap: () {
                            Get.to(()=> ChangeLanguage());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Change Language',weight: FontWeight.w500,
                                size: 16.sp,
                              ),

                              Icon(Icons.navigate_next_outlined,color: Color(0xffE0E0E0),),

                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),

                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: -50.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Center(
                        child: GeneralImageWidget(
                          imagePath: AssetsImages.dummyImage,
                          radius: 50.sp,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Obx(
                        () =>  MyText(
                          text:  '${userModelGlobal.value.firstName??''} ${userModelGlobal.value.lastName??''}',
                          color: kSecondaryColor,
                          size: 16.sp,
                          weight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}