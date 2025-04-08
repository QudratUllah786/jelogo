import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{


  RxBool isFormValid = false.obs;

  void validateForm(GlobalKey<FormState> formKey) {

    isFormValid.value = formKey.currentState?.validate() ?? false;

  }


}