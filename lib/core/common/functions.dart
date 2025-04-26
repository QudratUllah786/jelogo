import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:jelogo/utils/snackbars.dart';
import 'package:local_auth/local_auth.dart';

import '../../api/api_service.dart';
import '../../controller/home_controller.dart';
import '../../local_storage/local_storage.dart';
import '../../model/user/user_model.dart';
import '../../utils/dialogs.dart';
import '../../utils/global_instances.dart';
import '../constants/endpoints.dart';

// import 'functions.dart' as GetStorage;

Future<bool> showAccount() async {
  DialogService.instance.showProgressDialog();

  final res = await APIService.instance.
  get(showAccountUrl, false);
  log('response:${res.toString()}');

  DialogService.instance.hideLoading();
  if (res.$1 != null && res.$2 == 200) {
   // UserModel userModel = UserModel.fromJson(res.$1 as Map<String, dynamic>);
    User user = User.fromJson(res.$1!['data']);
    userModelGlobal.value = user;
    return true;
  }

  if(res.$1 != null && res.$2 == 401){
    CustomSnackBars.instance.showFailureSnackbar(title: 'ohh', message: 'Session expired login again');
   await LocalStorageService.instance.deleteKey(key: 'accessToken');
    return false;

  }


  return false;
}
final LocalAuthentication auth = LocalAuthentication();

Future<bool> authenticate() async {
  try {
    bool didAuthenticate = await auth.authenticate(
      localizedReason: 'Please authenticate to access the app',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
    return didAuthenticate;
    return didAuthenticate;

  } catch (e) {
    log('error in finger auth:${e.toString()}');
    //   authStatus.value = "Error: $e";
    return false;
  }
}

Future<void> getUserData() async {
  String? savedToken = await LocalStorageService.instance.read(key: 'accessToken');
  log('savedToken:${savedToken.toString()}');
  if (savedToken != null) {
    accessToken.value = savedToken;
    log('accessToken:${accessToken.value}');
  } else {
    accessToken.value = '';
  }
}


// // 1. Convert Contact to a Map manually
// Map<String, dynamic> contactToJson(Contact contact) {
//   return {
//     'fullName': contact.fullName,
//     'phoneNumber': contact.selectedPhoneNumber,
//   };
// }
//
// // 2. Convert Map back to Contact
// Contact contactFromJson(Map<String, dynamic> json) {
//   return Contact(
//     fullName: json['fullName'],
//     selectedPhoneNumber: Contact(selectedPhoneNumber: json['phoneNumber']),
//   );
// }


Future<void> init() async {

}

double addOnePointFivePercent(String amountStr) {
  // Convert string to double
  double amount = double.tryParse(amountStr) ?? 0.0;

  // Calculate 1.5% of the amount
  double percentage = amount * 0.015;

  // Return the total
  return amount + percentage;
}


String formatDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString).toLocal(); // Convert to local time if needed
  return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
}



double removePointFivePercent(String amountStr) {
  // Convert string to double
  double amount = double.tryParse(amountStr) ?? 0.0;

  // Calculate 1.5% of the amount
  double percentage = amount * 0.015;

  // Return the total
  return amount - percentage;
}

