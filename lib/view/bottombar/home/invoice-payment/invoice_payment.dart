import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/view/bottombar/home/bills.dart';
import 'package:jelogo/view/bottombar/home/invoice-payment/merchants.dart';
import 'package:jelogo/view/bottombar/home/invoice-payment/transport.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';

import '../../../../constants/app_Colors.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/news_card.dart';
import '../../../news_screen.dart';
class InvoicePayment extends StatelessWidget {
  const InvoicePayment({super.key});

  static  List<Map<String,dynamic>> serviceList = [{
    'title':'Merchants',
    'image':AssetsImages.merchant,
    "route": () {
      Get.to(()=> Merchants());
    },


   },
    {
    'title':'Transports',
    'image':AssetsImages.transport,
      "route": () {
      Get.to(()=> Transport());
      },
    },
    {
      'title':'Bills',
      'image':AssetsImages.bills,
      "route": () {

        Get.to(()=> Bills());

      },

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Invoice Payments'),
      body: Padding(  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: 'Invoice Payments & Services',size: 20.sp,weight: FontWeight.w600,),

            SizedBox(height: 20.h,),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable nested scrolling issues
              itemCount: serviceList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10, // Add spacing
                mainAxisSpacing: 10,  // Add spacing
                childAspectRatio: 0.75, // Adjust item height
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200.h, // Constrain height
                  child: InkWell(
                    onTap:  serviceList[index]['route'],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(text: serviceList[index]['title'],size: 16.sp,weight: FontWeight.w600     ,),
                        const SizedBox(height: 5), // Add spacing
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kSecondaryColor.withValues(alpha: 0.1),
                                // Soft shadow
                                blurRadius: 10,
                                // Spread of the shadow
                                offset: Offset(2, 2), // Shadow position (X, Y)
                              ),
                            ],
                          ),
                          child: ClipRRect(

                            borderRadius: BorderRadius.circular(15), // Apply rounded corners
                            child: GeneralImageWidget(
                              imagePath: serviceList[index]['image'],
                              width: 151.w,
                              height:170.h,
                              fit: BoxFit.cover, // Ensure proper image scaling
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
         /*   MyText(text: 'News',size: 18.sp,weight: FontWeight.w600,),

            InkWell(
              onTap: () {
                Get.to(()=> NewsDetailScreen({
                  'title': "Profitez des soldes",
                  'subtitle': "Gagnez jusqu’à 100.000 XOF",
                  'description': "Recevez 500 XOF sur votre compte pour chaque utilisateur invité qui a un compte valide.",
                  'referralCode': "IOJLFH",
                }),);
              },
              child: NewsCard(
                title: "Profitez des soldes",
                subtitle: "Gagnez jusqu’à 100.000 XOF",
                description: "Recevez 500 XOF sur votre compte pour chaque utilisateur invité qui a un compte valide.",
                referralCode: "IOJLFH",
              ),
            )*/


          ],
        ),
      ),

      ),
    );
  }
}
