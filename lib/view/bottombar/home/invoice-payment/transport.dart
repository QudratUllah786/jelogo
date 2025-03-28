import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/view/bottombar/home/transfer.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_phone_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../../constants/assets_images.dart';

class Transport extends StatelessWidget {
  Transport({super.key});

  final List<Map<String, dynamic>> listItems = [
    {
      "icon": AssetsImages.yango,
      "label": "Yango",
      "route": () {},
    },
    {
      "icon": AssetsImages.uber,
      "label": "Uber",
      "route":  () {},
    },
    {
      "icon": AssetsImages.heetech,
      "label": "Heetch",
      "route":  () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(
        title: 'Transport',
        titleSize: 20,

      ),
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

           //   MyText(text: 'Select An  Option',color: kSubheadingColor,size: 12,weight: FontWeight.w600,),

               

              ListView.builder(
                shrinkWrap:true,
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return ReusableCard(
                      imagePath: listItems[index]['icon'],
                      title: listItems[index]['label'],
                      onTap: listItems[index]['route']);
                },)
            ],
          ),
        ),



      ),
    );
  }
}



class ReusableCard extends StatelessWidget {
  final String imagePath; // Image path for the icon
  final String title; // Title text
  final Function()? onTap;// Function to handle tap on the icon button
  final Color? bgColor;
  const ReusableCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80.h, // Responsive height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp), // Responsive border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Soft shadow
                  blurRadius: 10, // Spread of the shadow
                  offset: Offset(2, 2), // Shadow position (X, Y)
                ),
              ],
              color:bgColor?? Colors.white, // Background color
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: Icon and Text
                Padding(
                  padding: EdgeInsets.only(left: 10.w), // Responsive padding
                  child: Row(
                    children: [
                      // Icon Container
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE9E9E9), // Background color for the icon
                          borderRadius: BorderRadius.circular(12.sp), // Responsive border radius
                        ),
                        alignment: Alignment.center,
                        width: 50.w, // Responsive width
                        height: 50.h, // Responsive height
                        child: GeneralImageWidget(
                          imagePath: imagePath, // Dynamic image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20.w), // Spacing between icon and text
                      // Title Text
                      SizedBox(
                        width: Get.width*0.4,
                        child: MyText(
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          text: title, // Dynamic title
                          size: 16.sp, // Responsive font size
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.navigate_next_outlined,
                  size: 30.sp, // Responsive icon size
                ),

              ],
            ),
          ),
        ),
        SizedBox(height: 15,),

      ],
    );
  }
}



