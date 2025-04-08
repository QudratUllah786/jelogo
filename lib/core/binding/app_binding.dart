import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class AuthBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }

}