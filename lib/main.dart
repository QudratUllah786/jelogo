import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jelogo/core/common/functions.dart';
import 'package:jelogo/view/auth/sign_in.dart';
import 'package:jelogo/view/bottombar/jelogo_bottom_bar.dart';
import 'package:jelogo/view/splash/splash.dart';






Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await GetStorage.init();
  runApp(const MyApp());
}

var dummyImage = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY6qtMj2fJlymAcGTWLvNtVSCULkLnWYCDcQ&s';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Jelogo',
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),
          home: SplashScreen()
        );
      },
    );
  }
}


