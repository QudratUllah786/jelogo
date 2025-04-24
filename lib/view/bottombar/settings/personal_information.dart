import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/controller/profile_controller.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/utils/file_pickers/image_picker.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/utils/validators.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../constants/app_sizes.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key,this.isDocument,this.isAccount});
  final bool? isAccount;
  final bool? isDocument;


  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  final profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  bool isAccount = true;
  bool isDocument = false;

  @override
  void initState() {

    if(widget.isDocument == true){
      isDocument = true;
      isAccount = false;
    }


    if(widget.isAccount == true){
      isDocument = false;
      isAccount = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Account and documents',
        titleSize: 20.sp,
      ),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child:isAccount? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildToggleButtons(),
              SizedBox(height: 30.h),
              _buildProfileSection(),
              SizedBox(height: 40.h),
              _buildPersonalInformationSection(),
              SizedBox(height: 20.h,),

              BlueButton(ButtonText: 'Update', onTap: () async {

                if(!_formKey.currentState!.validate()){
                  return;
                }

              await  profileController.updateProfile();

              },),

              SizedBox(height: 10.h,)
            ],
          ),
        ):

            /// Documents section
        Column(
          children: <Widget>[

            SizedBox(height: 20.h),
            _buildToggleButtons(),
            SizedBox(height: 80.h),
            Obx(
              () => profileController.documents.isEmpty?
              MyText(text: 'no documents'):
              ListView.builder(
                shrinkWrap: true,
                itemCount:  profileController.documents.length,

                  itemBuilder: (context,index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 320.w,
                    height: 149.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profileController.documents[index].url?? dummyImage))
                    ),
                  );
                }
              ),
            )
          ],
        )

        ,
      ),
    );
  }

  /// Custom Widget for Toggle Buttons
  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlueButton(
          ButtonText: 'Account',
          onTap: () {
            setState(() {
              isAccount = true;
              isDocument = false;
            });
          },
          width: 155.w,
          backgroundColor: isAccount ? kSecondaryColor : kPrimaryColor,
          textColor: isAccount ? kPrimaryColor : kTertiaryColor,
        ),
        BlueButton(
          ButtonText: 'Documents',
          onTap: () async {

         //   await   profileController.getDocuments();

            setState(()  {


              isDocument = true;
              isAccount = false;

              /// TODO document api


            });
          },
          width: 155.w,
          backgroundColor: isDocument ? kSecondaryColor : kPrimaryColor,
          textColor: isDocument ? kPrimaryColor : kTertiaryColor,
        ),
      ],
    );
  }

  /// Custom Widget for Profile Section
  Widget _buildProfileSection() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () =>  GeneralImageWidget(
              width: 100.w,
              height: 100.h,
              radius: 100.sp,
              imagePath: AssetsImages.dummyImage,
              file: File(profileController.profilePicture.value),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            // left:0,
            right: 0,
            top: 60.h,
            bottom: 0,
            child: InkWell(
              onTap: () {
                ImagePickerService.instance.openProfilePickerBottomSheet(context: context,
                    onCameraPick: () async {
                      XFile? image = await ImagePickerService.instance.pickImageFromCamera();
                      if(image!= null){
                        profileController.profilePicture.value = image.path;
                       // profileController.updateProfilePicture(context);
                      }                    },
                    onGalleryPick: () async {
                      XFile? image =    await  ImagePickerService.instance.pickSingleImageFromGallery();
                      if(image!= null){
                        profileController.profilePicture.value = image.path;
                        // profileController.updateProfilePicture(context);
                      }

                    },);
              },
              child: Container(
                width: 30.w,
                alignment: Alignment.center,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSecondaryColor,
                ),
                child: GeneralImageWidget(

                  imagePath: AssetsImages.imageAdd,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Custom Widget for Personal Information Section
  Widget _buildPersonalInformationSection() {
    return SingleChildScrollView(
      child: Obx(
         () =>  Form(
           key: _formKey,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Personal Information',
                color: kSecondaryColor,
                size: 17.sp,
                weight: FontWeight.w600,
              ),
              SizedBox(height: 20.h),
              _buildEditableInfoRow('Account Number', '122',readOnly: true,
              controller: profileController.accNoCtrl
              ),


              SizedBox(height: 10.h),
              _buildEditableInfoRow('Username', userModelGlobal.value.name??'',
                  validator:ValidationService.instance.emptyValidator,
              controller: profileController.userNameCtrl
              ),
              SizedBox(height: 10.h),
              _buildEditableInfoRow('Email', userModelGlobal.value.email??'',
                  validator:ValidationService.instance.emailValidator,
                keyboardType: TextInputType.emailAddress,
                controller: profileController.emailCtrl
              ),
              SizedBox(height: 10.h),
              _buildEditableInfoRow('Mobile Phone', '+${userModelGlobal.value.countryCode??''} ${ userModelGlobal.value.phone??''}',
               validator:ValidationService.instance.emptyValidator,
                controller: profileController.mobileNoCtrl,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10.h),
              _buildEditableInfoRow('Address', userModelGlobal.value.address??'', isAddress: true,
                  validator:ValidationService.instance.emptyValidator,
                controller: profileController.addressCtrl

              ),






            ],
                   ),
         ),
      ),
    );
  }

  /// Custom Widget for Information Row
  Widget _buildEditableInfoRow(
      String label,
      String initialValue,

      {
        bool isAddress = false,
        TextEditingController? controller,
        String? Function(String?)? validator,
        void Function(String)? onChanged,
        TextInputType? keyboardType,
        bool?readOnly,

      }
      ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xffF2F1F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: label,
            size: 12.sp,
            weight: FontWeight.w500,
            color: kSecondaryColor,
          ),
          SizedBox(height: 8), // Add some spacing between label and input
          // if (isAddress)
          //   SizedBox(
          //     width: Get.width * 0.7, // Increased width for text field
          //     child: TextField(
          //       controller: controller ?? TextEditingController(text: initialValue),
          //       onChanged: onChanged,
          //       maxLines: 1,
          //       style: TextStyle(
          //         fontSize: 12.sp,
          //         fontWeight: FontWeight.w400,
          //         color: kSubheadingColor,
          //       ),
          //       decoration: InputDecoration(
          //         isDense: true,
          //         contentPadding: EdgeInsets.symmetric(vertical: 8),
          //         border: UnderlineInputBorder(
          //           borderSide: BorderSide(color: kSubheadingColor.withOpacity(0.3)),
          //         ),
          //         focusedBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(color: kSecondaryColor),
          //         ),
          //       ),
          //     ),
          //   )
          // else
            TextFormField(
              readOnly:readOnly?? false,
              validator:validator ,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller ?? TextEditingController(text: initialValue),
              onChanged: onChanged,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: kSubheadingColor,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kSubheadingColor.withOpacity(0.3)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kSecondaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}






