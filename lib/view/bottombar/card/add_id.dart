import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/controller/card_controller.dart';
import 'package:jelogo/utils/file_pickers/image_picker.dart';
import 'package:jelogo/utils/snackbars.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/custom_dropdown.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/upload_button.dart';
class AddId extends StatelessWidget {
   AddId({super.key});
  final cardController = Get.find<CardController>();

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

            Obx(
              () => CustomDropdown(
                title: 'Choose your Id',
                items: cardController.documentList.value,
                onChanged: (value) {

                  cardController.docTypeId.value = value?.id??'';

                },
              ),
            ),
            SizedBox(height: 20.h,),

            Obx(
              () =>  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadButton(title: 'Photo CNI Front',
                    onTap: () {

                    ImagePickerService.instance.openProfilePickerBottomSheet(
                      onCameraPick: () async {
                        Get.back();
                     final image =  await ImagePickerService.instance.pickImageFromCamera();
                     cardController.frontCni.value = image?.path??'';
                      },
                      onGalleryPick: () async {
                        Get.back();
                     final image =   await ImagePickerService.instance.pickSingleImageFromGallery();
                     cardController.frontCni.value = image?.path??'';
                      },
                      context: context,
                    );

                  },
                    imagePath:File( cardController.frontCni.value),

                  ),
                  Obx(
                    () =>  UploadButton(
                      imagePath:File(cardController.backCni.value)  ,
                      title: 'Photo CNI Back',
                      onTap: () {  ImagePickerService.instance.openProfilePickerBottomSheet(
                      onCameraPick: () async {
                        Get.back();
                        final image =  await ImagePickerService.instance.pickImageFromCamera();
                        cardController.backCni.value = image?.path??'';
                      },
                      onGalleryPick: () async {
                        Get.back();
                        final image =   await ImagePickerService.instance.pickSingleImageFromGallery();
                        cardController.backCni.value = image?.path??'';
                      }, context: context,
                    );
                    },

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Obx(
              () =>  UploadButton(
                title: 'Upload Your Picture',
                onTap: () {
                ImagePickerService.instance.openProfilePickerBottomSheet(
                  onCameraPick: () async {
                    Get.back();
                    final image =  await ImagePickerService.instance.pickImageFromCamera();
                    cardController.picture.value = image?.path??'';
                  },

                  onGalleryPick: () async {
                    Get.back();
                    final image =   await ImagePickerService.instance.pickSingleImageFromGallery();
                    cardController.picture.value = image?.path??'';
                  }, context: context,
                );

              },
                imagePath: File(cardController.picture.value),

              ),
            ),
            
        Spacer(),
            
            BlueButton(ButtonText: 'Add a Credit Card', onTap: () async {

              if(cardController.docTypeId.value.isEmpty){
                return CustomSnackBars.instance.showToast(message: 'please select your id');
              }

              if(cardController.picture.value.isEmpty || cardController.frontCni.value.isEmpty || cardController.backCni.value.isEmpty){
                return CustomSnackBars.instance.showToast(message: 'please upload complete documents');
              }

            await cardController.createOrderCard();

            },),

            SizedBox(height: 10,)


          ],
        ),
      ),

    );
  }
}
