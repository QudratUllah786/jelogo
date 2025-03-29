import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/my_text.dart';
import '../../../constants/app_Colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../widgets/blue_button.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            MyNotificationContainer(
              titleText: 'Payment Received',
              subTitle: 'You have received \$150 from John Doe.',
              time: '5 min ago',
              Img: AssetsImages.logo,
              onTap: () {},
            ),
            SizedBox(height: 10.h),
            MyNotificationContainer(
              titleText: 'New Booking Request',
              subTitle: 'Mike has requested an appointment.',
              time: '1 hour ago',
              iconImg: false,
              Img: AssetsImages.logo,
              isRequest: true,
              onTap: () {},
              onAcceptTap: () {},
              onRejectTap: () {},
            ),
            SizedBox(height: 10.h),
            MyNotificationContainer(
              titleText: 'Service Completed',
              iconImg: false,
              subTitle: 'Your recent service has been marked as completed.',
              time: 'Yesterday',
              Img: AssetsImages.logo,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}


class MyNotificationContainer extends StatelessWidget {
  final String titleText;
  final String subTitle;
  final String time;
  final String Img;
  final bool iconImg;
  final bool? istapped, isRequest;
  final VoidCallback? onTap, onAcceptTap, onRejectTap;

  const MyNotificationContainer(
      {super.key,
        required this.titleText,
        required this.subTitle,
        required this.time,
        required this.Img,
        this.iconImg = true,
        required this.onTap,
        this.istapped,
        this.isRequest,
        this.onAcceptTap,
        this.onRejectTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: kFillColor,
              border: Border.all(color: kBordercolor),
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: kFillColor,
                        border: Border.all(color: kBordercolor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: Image.asset(Img,
                            fit: iconImg ? BoxFit.cover : null),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: titleText,
                            color: kTertiaryColor,
                            size: 16.sp,
                            fontFamily: AppFonts.POPPINS,
                            weight: FontWeight.w600,
                            letterSpacing: 0.2,
                            // maxLines: 1,
                            // textOverflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: subTitle,
                                  color: khintColor,
                                  size: 15.sp,
                                  fontFamily: AppFonts.POPPINS,
                                  weight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (isRequest == true)
                                MyText(
                                  text: 'View',
                                  color: kTertiaryColor,
                                  size: 13.sp,
                                  fontFamily: AppFonts.POPPINS,
                                  weight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -6,
                  right: 0,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: MyText(
                      text: time,
                      color: kBrown,
                      size: 14.5.sp,
                      fontFamily: AppFonts.POPPINS,
                      weight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (istapped == true) ...{
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                  child: BlueButton(
                      radius: 12,
                      fontSize: 14,
                      height: 42,
                      backgroundColor: kpink,
                      ButtonText: 'Accept',
                      onTap: onAcceptTap == null ? () {} : onAcceptTap!)),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: BlueButton(
                      radius: 12,
                      fontSize: 14,
                      height: 42,
                      backgroundColor: kgreyish,
                      ButtonText: 'Decline',
                      onTap: onRejectTap == null ? () {} : onRejectTap!))
            ],
          )
        }
      ],
    );
  }
}