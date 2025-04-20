import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/binding/app_binding.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/local_storage/local_storage.dart';
import 'package:jelogo/utils/dialogs.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/utils/snackbars.dart';

import '../local_storage/secure_storage.dart';
import '../model/user/user_model.dart';
import '../view/auth/sign_in.dart';

class ProfileController extends GetxController{

  var profilePicture = ''.obs;
  
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController accNoCtrl = TextEditingController();
  TextEditingController mobileNoCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  
  
  updateProfile() async {
    
    
    DialogService.instance.showProgressDialog();
    
    var body= {

      "name":userNameCtrl.text.trim(),
      "address":addressCtrl.text.trim(),
      "phone":mobileNoCtrl.text.trim(),
      "email":emailCtrl.text.trim(),


    };

    log('body:${body}');
    final res = await APIService.instance.put(updateAccountUrl, body, false);
   log('res:${res}');
    DialogService.instance.hideLoading();
    if(res.$1!= null && res.$2 == 200){
      CustomSnackBars.instance.showSuccessSnackbar(title: 'Success', message: res.$1?['message']);
      User user = User.fromJson(res.$1!['data']);
      userModelGlobal.value = user;
      Get.close(1);
      return;
    }
    if(res.$1 != null && res.$2 == 401){

      String ?refreshToken = await SecureStorageService.instance.read(key: 'refreshToken');

      accessToken.value = refreshToken??'';
      CustomSnackBars.instance.showFailureSnackbar(title: 'ohh', message: 'Session expired login again');
      await LocalStorageService.instance.deleteKey(key: 'accessToken');
      userModelGlobal.value = User();
      Get.offAll(()=> SignIn(),binding: AuthBindings());
      return;
    }




    CustomSnackBars.instance.showFailureSnackbar(title: 'Ohh', message: res.$1?['message']);

    if(res.$1 != null && res.$2 == 401){
     await LocalStorageService.instance.deleteKey(key: 'accessToken');
      userModelGlobal.value = User();
      Get.offAll(()=> SignIn(),binding: AuthBindings());
    }




  }


  @override
  void onReady() {
    accNoCtrl.text = '12345';
    userNameCtrl.text = userModelGlobal.value.name??'';
    emailCtrl.text = userModelGlobal.value.email??'';
    mobileNoCtrl.text = '${userModelGlobal.value.countryCode??''}${userModelGlobal.value.phone??''}';
    addressCtrl.text = userModelGlobal.value.address??'';
    super.onReady();
  }



}