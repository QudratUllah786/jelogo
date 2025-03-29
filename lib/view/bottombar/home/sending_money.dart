import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/view/bottombar/home/transfer.dart';
import 'package:jelogo/view/banques.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../constants/assets_images.dart';
import '../../../widgets/news_card.dart';
import '../../news_screen.dart';
class SendingMoney extends StatelessWidget {
   SendingMoney({super.key});

  final List<Map<String, dynamic>> listItems = [
    {
      "icon": AssetsImages.image7,
      "label": "Orange Money",
      "route": () => Get.to(Transfer()),
    },
    {
      "icon": AssetsImages.image8,
      "label": "Moov Money",
      "route": () => Get.to(Transfer()),
    },
    {
      "icon": AssetsImages.image9,
      "label": "MTN Money",
      "route": () => Get.to(Transfer()),
    },
    {
      "icon": AssetsImages.image10,
      "label": "Wave",
      "route": () => Get.to(Transfer()),
    },
    {
      "icon": AssetsImages.image11,
      "label": "Banques",
      "route": () => Get.to(Banques()),
    },
    {
      "icon": AssetsImages.image12,
      "label": "Jelogo",
      "route": () => Get.to(Transfer()),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(
        title: 'Sending Money',
         titleSize: 20,
        
      ),
body: Scaffold(
  body: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          MyText(text: 'Select An  Option',color: kSubheadingColor,size: 12,weight: FontWeight.w600,),
      
      
          SizedBox(height: 20.h,),
      
         ListView.builder(
           physics: NeverScrollableScrollPhysics(),
           shrinkWrap:true,
           itemCount: listItems.length,
           itemBuilder: (context, index) {
           return ReusableCard(
               imagePath: listItems[index]['icon'],
               title: listItems[index]['label'],
               onTap: listItems[index]['route']);
         },),
      
          SizedBox(height: 20.h,),
          //
          // MyText(text: 'News',size: 18.sp,weight: FontWeight.w600,),
          //
          // InkWell(
          //   onTap: () {
          //     Get.to(()=> NewsDetailScreen({
          //       'title': "Profitez des soldes",
          //       'subtitle': "Gagnez jusqu’à 100.000 XOF",
          //       'description': "Recevez 500 XOF sur votre compte pour chaque utilisateur invité qui a un compte valide.",
          //       'referralCode': "IOJLFH",
          //     }),);
          //   },
          //   child: NewsCard(
          //     title: "Profitez des soldes",
          //     subtitle: "Gagnez jusqu’à 100.000 XOF",
          //     description: "Recevez 500 XOF sur votre compte pour chaque utilisateur invité qui a un compte valide.",
          //     referralCode: "IOJLFH",
          //   ),
          // )
      
      
      
        ],
      ),
    ),
  ),
  
  
  
),
    );
  }
}



class ReusableCard extends StatelessWidget {
  final String imagePath; // Image path for the icon
  final String title; // Title text
 final Function()? onTap; // Function to handle tap on the icon button

  const ReusableCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
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
              color: Colors.white, // Background color
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
                      MyText(
                        text: title, // Dynamic title
                        size: 16.sp, // Responsive font size
                        weight: FontWeight.w600,
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