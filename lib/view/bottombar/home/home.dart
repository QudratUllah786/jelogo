import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jelogo/constants/app_colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/auth/forgetpassword/forget_password.dart';
import 'package:jelogo/view/auth/pin_screen.dart';
import 'package:jelogo/view/auth/sign_up.dart';
import 'package:jelogo/view/bottombar/home/invoice-payment/invoice_payment.dart';
import 'package:jelogo/view/bottombar/home/notifications.dart';
import 'package:jelogo/view/bottombar/home/pass-purchase/pass_purchase.dart';
import 'package:jelogo/view/bottombar/home/payment_history.dart';
import 'package:jelogo/view/bottombar/home/recharge/recharge.dart';
import 'package:jelogo/view/bottombar/home/scan_sending.dart';
import 'package:jelogo/view/bottombar/home/sending_money.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../constants/app_fonts.dart';
import 'drawer/custom_drawer.dart';

class Home extends StatelessWidget {
  Home({super.key});


  final List<Map<String, dynamic>> gridItems = [
    {
      "icon": AssetsImages.money,
      "label": "Money Transfer",
      "route": () => Get.to(SendingMoney()),
    },
    {
      "icon": AssetsImages.sending,
      "label": "Scan Sending",
      "route": () => Get.to(()=>ScanSending()),
    },
    {
      "icon": AssetsImages.balance,
      "label": "Top Up Balance",
      "route": () => Get.to(Recharge()),
    },
    {
      "icon": AssetsImages.purchase,
      "label": "Transfer & Purchase Passes",
      "route": () => Get.to(PassPurchase()),
    },
    {
      "icon": AssetsImages.payments,
      "label": "Payments",
      "route": () => Get.to(InvoicePayment()),
    },
    {
      "icon": AssetsImages.history,
      "label": "History",
      "route": () => Get.to(PaymentHistory()),
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      key: _scaffoldKey,
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        scrolledUnderElevation: 0,
        backgroundColor: kSecondaryColor,
        leading: InkWell(
          onTap: () {
            log('jjh');
            _scaffoldKey.currentState?.openDrawer();
          },

          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetsImages.dummyImage),
            ),
          ),
        ),

        title: MyText(
          text: 'Hi, Push Puttichai',
          size: 16.sp,
          color: kPrimaryColor,
          weight: FontWeight.w500,
          fontFamily: AppFonts.POPPINS,
          letterSpacing: 0.3,
        ),
        actions: [
          IconButton(onPressed: () {

            Get.to(()=>PinScreen() );

          }, icon: Icon(Icons.lock_open,
            size: 30.sp,
            color: kPrimaryColor,
          )),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(()=> Notifications());
                },
                icon: Icon(
                  Icons.notifications,
                  color: kPrimaryColor,
                  size: 30.sp,
                ),
              ),




              Positioned(
                right: 8.w,
                top: 8.h,
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF4267),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: MyText(
                      text: '2',
                      color: Colors.white,
                      size: 10.sp,
                      fontFamily: AppFonts.POPPINS,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer:CustomDrawer(),
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: Get.height * 0.165,
                    left: Get.width * 0.03,
                    right: Get.width * 0.03,
                    child: Container(
                      height: Get.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                  ),
                  // Main Card
                  Container(
                    height: Get.height * 0.25,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF001F3F), Color(0xFF003366)], // Dark blue gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.sp),
                      image: DecorationImage(
                        image: AssetImage(AssetsImages.mask),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Card Title
                        GeneralImageWidget(
                          imagePath: AssetsImages.logo,
                          width: 70.w,
                          height: 40.h,
                          color: Colors.white,

                        ),
                        // Balance and Eye Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: "\$45.500,12",
                              size: 28.sp,
                              color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                            Image.asset(
                              AssetsImages.eye,
                              height: Get.height * 0.04,
                              width: Get.height * 0.04,
                            ),
                          ],
                        ),
                        // Card Number and Logo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: "444 221 224 ***",
                              weight: FontWeight.w600,
                              size: 14.sp,
                              color: Colors.yellow,
                            ),
                            Image.asset(
                              AssetsImages.oneLinkCard,
                              height: Get.height * 0.08,
                              width: Get.height * 0.08,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: gridItems.map((item) {
                  return GridItem(
                    icon: item["icon"],
                    label: item["label"],
                    onTap:  item["route"],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String icon;
  final String label;
  final Function() onTap;

  const GridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GeneralImageWidget(
              imagePath: icon,
            ),
            SizedBox(height: 8),
            MyText(
              text: label,
              size: 12.sp,
              weight: FontWeight.w500,
              textAlign: TextAlign.center,
              color: Color(0xff979797),
            ),
          ],
        ),
      ),
    );
  }
}