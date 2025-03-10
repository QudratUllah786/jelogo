import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/view/auth/sign_in.dart';
import 'package:jelogo/widgets/general_image_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){

      Get.to(()=>SignIn());

    });
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
