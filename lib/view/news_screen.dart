import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_fonts.dart';
import 'package:jelogo/widgets/news_card.dart';

import '../constants/assets_images.dart';
import '../widgets/appbar.dart';
import '../widgets/my_text.dart';




class NewsScreen extends StatelessWidget {


  const NewsScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:simpleAppBar(title:'News'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Get.to(()=> NewsDetailScreen());
                },
                child: NewsCard()),
          ],
        ),
      ),
    );
  }
}



class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'News Detail'),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 MyText(
                  text:"Mudryk will bring to Chelsea & reflects on 'valuable' victory",
                  size: 20, weight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    text: "Wed, Jan 18 by ",
                    style: TextStyle(color: Colors.black54, fontSize: 14,fontFamily: AppFonts.POPPINS),
                    children: [
                      TextSpan(
                        text: "Lina Punk London",
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: AppFonts.POPPINS),
                      ),
                      TextSpan(text: " • 10 min read",style: TextStyle(fontFamily: AppFonts.POPPINS)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetsImages.payment, // Replace with your image
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                MyText(
                 text: "WHAT HAPPENED? The new £89m (\$109m) man was in attendance at Stamford Bridge as a bullet header from Kai Havertz was enough to secure Chelsea a crucial win. Potter underlined the importance of getting points on the board over implementing his style of play...",
                  size: 14, ),

                const SizedBox(height: 12),
                 MyText(
                 text: "WHAT THEY SAID: “Today we are happy for the three points. Overall we played quite well, they had their moments as well but today was about getting the victory...",
                 size: 14,
                ),
                const SizedBox(height: 80), // Padding for bottom bar
              ],
            ),
          ),

          // Floating Bottom Bar

        ],
      ),
    );
  }
}


