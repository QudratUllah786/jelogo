import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/core/binding/app_binding.dart';
import 'package:jelogo/local_storage/local_storage.dart';
import 'package:jelogo/main.dart';
import 'package:jelogo/model/user/user_model.dart';
import 'package:jelogo/utils/dialogs.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/view/auth/sign_in.dart';
import 'package:jelogo/view/bottombar/home/notifications.dart';
import 'package:jelogo/view/bottombar/settings/personal_information.dart';
import 'package:jelogo/view/bottombar/settings/settings.dart';
import 'package:jelogo/view/coupan_screen.dart';
import 'package:jelogo/view/news_screen.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../payment_history.dart';
import 'DrawerListTile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Profile Section
              Obx(
                () =>  UserAccountsDrawerHeader(
                  accountName: MyText(text: userModelGlobal.value.name??'',weight: FontWeight.w700,size: 16.sp,),
                  accountEmail: MyText(text:userModelGlobal.value.email?? "",color: Color(0xff6C7072),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(userModelGlobal.value.avatar?? dummyImage),
                  ),
                  decoration: BoxDecoration(color: Colors.white),

                ),
              ),
          
              /// Drawer Menu Items
              DrawerListTile(icon: Icons.home_outlined, title: "Home", onTap: () {
                Get.back();
              }),
              DrawerListTile(icon: Icons.history, title: "History", onTap: () {
                Get.to(()=>PaymentHistory(),binding: TransactionBindings());
              }),
              DrawerListTile(icon: Icons.account_balance_wallet_outlined, title: "Account", onTap: () {
          
          
                Get.to(()=> PersonalInformation(
                  isAccount: true,
                ),binding: ProfileBindings());
          
          
          
              }),
              DrawerListTile(icon: Icons.notifications_none_outlined, title: "Notifications", onTap: () {
          
                Get.to(()=> Notifications());
          
              }),
              DrawerListTile(icon: Icons.person_outline, title: "Profile", onTap: () {
          
                Get.to(()=> Settings());
              }),
              DrawerListTile(icon: Icons.newspaper, title: "News", onTap: () {
             Get.to(()=>NewsScreen());
              }),
              DrawerListTile(icon: Icons.discount, title: "Coupon", onTap: () {
          
                Get.to(()=> CouponScreen());
              }),
          
            //  Spacer(), // Push buttons to the bottom
          
              // Invite a Friend Button
          
          
              SizedBox(height: 20.h,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlueButton(ButtonText: 'Invite a Friend',
                  height: 60.h,
                  onTap: () {
                },),
              ),
          
              SizedBox(height: 10.h,),
          
              /// Deactivate Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlueButton(
                  height: 60.h,
                  textColor: Colors.red,
                  backgroundColor: Colors.white,
                  borderColor: Colors.red,
                  ButtonText: 'Deactivate',
          
                  onTap: () async {

                    DialogService.instance.showProgressDialog();
                    await LocalStorageService.instance.deleteKey(key: 'accessToken');
                    userModelGlobal.value = User();
                    Get.offAll(()=> SignIn(),binding: AuthBindings());
                    DialogService.instance.hideLoading();
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
