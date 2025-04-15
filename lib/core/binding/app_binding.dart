import 'package:get/get.dart';
import 'package:jelogo/controller/home_controller.dart';
import 'package:jelogo/controller/profile_controller.dart';

import '../../controller/auth_controller.dart';

class AuthBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }
}


class BottomBarBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }




}


class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }




}