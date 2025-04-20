import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/controller/auth_controller.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/view/auth/sign_in.dart';
import 'package:jelogo/view/bottombar/jelogo_bottom_bar.dart';
import 'package:jelogo/widgets/general_image_widget.dart';

import '../../core/binding/app_binding.dart';
import '../../core/common/functions.dart';
import '../../local_storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void splashScreenHandler() {
    Future.delayed(Duration(seconds: 3),()async{
      await getUserData();
      //accessToken.value = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjA3NTkzODcwNTAiLCJjb3VudHJ5Q29kZSI6IjIyNSIsImlhdCI6MTc0NDczOTU2OCwiZXhwIjoxNzQ3MzMxNTY4fQ.UCzv9OZn5c0l7t3s-b4dg6c5G-3wwEWOulnIUzYUQWA";
      if (accessToken.value.isNotEmpty) {
        // log('token:${token.toString()}');
        // accessToken.value = token;
        final isAvailable =  await showAccount();
        if (isAvailable) {
          // await NotificationService.instance.setDeviceToken();
          Get.offAll(()=> JelogoBottomBar(),binding: BottomBarBindings());

        }
        else {
          // log('token:${token.toString()}');
          Get.to(()=>SignIn());
        }
      } else {
        // log('token:${token.toString()}');
        Get.to(()=>SignIn());
      }
    });


  }


  @override
  void initState() {
    splashScreenHandler();
    // Future.delayed(Duration(seconds: 3),() async {
    //
    //   String ?token = await LocalStorageService.instance.read(key: 'accessToken');
    //   log('token:${token}');
    //   if(token!= null){
    //     accessToken.value = token;
    //     log('token:$token');
    //
    // final isAvailable =    await showAccount();
    //
    // if(isAvailable){
    //   Get.offAll(()=> JelogoBottomBar());
    //   return;
    // }
    //
    //
    //
    //   }
    //   Get.to(()=>SignIn());
    //
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GeneralImageWidget(
                  height: MediaQuery.of(context).size.height * 0.25,
                  imagePath: AssetsImages.up,
                ),
              ),
              const Spacer(), // Space between images

              GeneralImageWidget(
                imagePath: AssetsImages.logo,
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomRight,
                child: GeneralImageWidget(
                  height: MediaQuery.of(context).size.height * 0.25,
                  imagePath: AssetsImages.down,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
