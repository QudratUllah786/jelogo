import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/main.dart';
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
        child:isAccount? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildToggleButtons(),
            SizedBox(height: 30.h),
            _buildProfileSection(),
            SizedBox(height: 40.h),
            _buildPersonalInformationSection(),
          ],
        ):

            /// Documents section
        Column(
          children: <Widget>[

            SizedBox(height: 20.h),
            _buildToggleButtons(),
            SizedBox(height: 80.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 320.w,
                  height: 149.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AssetsImages.documentImage))
                  ),
                ),
                Positioned(
                  right: -10.w, // Adjust to move left
                  top: 120.h, // Adjust this to move it up
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSecondaryColor,
                    ),
                    child: Center(
                      child: GeneralImageWidget(
                        imagePath: AssetsImages.imageAdd,
                      ),
                    ),
                  ),
                )


              ],
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
          onTap: () {
            setState(() {
              isDocument = true;
              isAccount = false;
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
          GeneralImageWidget(
            width: 100.w,
            height: 100.h,
            radius: 100.sp,
            imagePath: AssetsImages.dummyImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            // left:0,
            right: 0,
            top: 60.h,
            bottom: 0,
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
          )
        ],
      ),
    );
  }

  /// Custom Widget for Personal Information Section
  Widget _buildPersonalInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Personal Information',
          color: kSecondaryColor,
          size: 17.sp,
          weight: FontWeight.w600,
        ),
        SizedBox(height: 20.h),
        _buildInfoRow('Account Number', '3024982387'),
        SizedBox(height: 10.h),
        _buildInfoRow('Username', '3024982387'),
        SizedBox(height: 10.h),
        _buildInfoRow('Email', 'aryan.stirk2nd@gmail.com'),
        SizedBox(height: 10.h),
        _buildInfoRow('Mobile Phone', '+620932938232'),
        SizedBox(height: 10.h),
        _buildInfoRow('Address', 'Gotham Road 21', isAddress: true),
      ],
    );
  }

  /// Custom Widget for Information Row
  Widget _buildInfoRow(String label, String value, {bool isAddress = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xffF2F1F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: label,
            size: 12.sp,
            weight: FontWeight.w500,
            color: kSecondaryColor,
          ),
          if (isAddress)
            SizedBox(
              width: Get.width * 0.3,
              child: MyText(
                text: value,
                size: 12.sp,
                weight: FontWeight.w400,
                color: kSubheadingColor,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            )
          else
            MyText(
              text: value,
              size: 12.sp,
              weight: FontWeight.w400,
              color: kSubheadingColor,
            ),
        ],
      ),
    );
  }
}






