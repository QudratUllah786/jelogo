import 'package:get/get.dart';
import 'package:jelogo/controller/card_controller.dart';
import 'package:jelogo/controller/home_controller.dart';
import 'package:jelogo/controller/profile_controller.dart';
import 'package:jelogo/controller/transaction_controller.dart';
import 'package:jelogo/controller/transfer_controller.dart';

import '../../controller/auth_controller.dart';

class AuthBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }
}


class BottomBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class CardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CardController());
  }
}


class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}

class TransferBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TransferController());
  }
}

class TransactionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}