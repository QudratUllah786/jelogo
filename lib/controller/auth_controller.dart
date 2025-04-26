import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/common/functions.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/local_storage/local_storage.dart';
import 'package:jelogo/local_storage/secure_storage.dart';
import 'package:jelogo/model/auth/send_signup_otp_model.dart';
import 'package:jelogo/model/user/user_model.dart';
import 'package:jelogo/utils/dialogs.dart';
import 'package:jelogo/utils/global_instances.dart';
import 'package:jelogo/utils/snackbars.dart';
import 'package:jelogo/view/bottombar/jelogo_bottom_bar.dart';
import 'package:local_auth/local_auth.dart';

import '../core/binding/app_binding.dart';
import '../view/auth/create_secret_code.dart';
import '../view/auth/forgetpassword/change_password_success.dart';
import '../view/auth/forgetpassword/type_code.dart';
import '../view/auth/type_code_signup.dart';
import '../view/auth/welcome_screen.dart';

class AuthController extends GetxController {
  RxBool isFormValid = false.obs;
  RxBool isSignUpFormValid = false.obs;
  RxString signUpcountryCode = '225'.obs;
  RxString signInCountryCode = '225'.obs;
  RxString forgotPassCountryCode = '225'.obs;
  RxBool isCheck = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController verifyOtpController = TextEditingController();
  TextEditingController secretCodeController = TextEditingController();
  TextEditingController confSecretCodeController = TextEditingController();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController loginPhoneCtrl = TextEditingController();
  TextEditingController loginPassCtrl = TextEditingController();
  TextEditingController forgetPassPhone = TextEditingController();
  TextEditingController forgotPassCodeCtrl = TextEditingController();
  TextEditingController forgotSecretCodeController = TextEditingController();
  TextEditingController forgotConfSecretCodeController =
      TextEditingController();

  RxBool passVisible = false.obs;
  RxBool confPassVisible = false.obs;
  Rx<DateTime> dob = DateTime.now().obs;
  RxString selectedGender = 'MALE'.obs;

  void validateForm(GlobalKey<FormState> formKey,
      TextEditingController controller, RxBool formVar) {
    if (controller.text.trim().isEmpty) {
      formVar.value = false;
      return;
    }

    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  void validateSignForm(GlobalKey<FormState> formKey) {
    isSignUpFormValid.value = formKey.currentState?.validate() ?? false;
  }

  sendSignUpOtp({bool resend = false}) async {
    DialogService.instance.showProgressDialog();
    Map<String, dynamic> body = {
      "phone": phoneController.text.trim(),
      "countryCode": signUpcountryCode.value,
    };
    final response = await APIService.instance
        .post(sendSignupOtpUrl, body, true, showResult: true, successCode: 201);
    DialogService.instance.hideLoading();

    if (response.$1 != null && response.$2 == 201) {
      SendSignOtpModel sendSignOtpModel =
          SendSignOtpModel.fromJson(response.$1!);

      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: sendSignOtpModel.message ?? '');
      if (resend == false) {
        Get.to(() => TypeCodeSignUp());
      }
      return;
    }
    CustomSnackBars.instance
        .showFailureSnackbar(title: 'Ohh', message: 'something went wrong');
  }

  otpVerification() async {
    DialogService.instance.showProgressDialog();
    Map<String, dynamic> body = {
      "phone": phoneController.text.trim(),
      "countryCode": signUpcountryCode.value,
      "code": verifyOtpController.text.trim()
    };
    final response = await APIService.instance.post(
        verifySignupOtpUrl, body, true,
        showResult: true, successCode: 201);
    DialogService.instance.hideLoading();

    if (response.$1 != null && response.$2 == 201) {
      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: response.$1?['message'] ?? '');
      Get.to(() => CreateSecretCode());
      return;
    }
    CustomSnackBars.instance.showFailureSnackbar(
        title: 'Ohh', message: response.$1?['message'] ?? '');
  }


  RxString  authStatus = "Not authenticated".obs;


  createAccount() async {
    DialogService.instance.showProgressDialog();

    Map<String, dynamic> userMap = User(
      email: emailCtrl.text.trim(),
      firstName: fNameCtrl.text.trim(),
      lastName: lNameCtrl.text.trim(),
      address: addressCtrl.text.trim(),
      birthDate: dob.value.toUtc().toIso8601String(),
      countryCode: signUpcountryCode.value,
      gender: selectedGender.value,
      phone: phoneController.text.trim(),
    ).toJson();

    userMap['password'] = secretCodeController.text.trim();

    log('user:$userMap');

    final response = await APIService.instance
        .post(createAccountUrl, userMap, true, successCode: 201);
    //   log('res:${response.$1!}');
    log('res:${response.toString()}');
    DialogService.instance.hideLoading();
    if (response.$1 != null && response.$2 == 201) {
      UserModel userModel = UserModel.fromJson(response.$1!);
      userModelGlobal.value = userModel.data?.user! ?? User();
      accessToken.value = userModel.data?.tokens?.accessToken ?? '';

      await LocalStorageService.instance
          .write(key: 'accessToken', value: accessToken.value);
      await LocalStorageService.instance.write(
          key: 'email', value: loginPhoneCtrl.text.trim());

      await LocalStorageService.instance.write(
          key: 'password', value: loginPassCtrl.text.trim());

      await SecureStorageService.instance.write(
          key: 'refreshToken',
          value: userModel.data?.tokens?.refreshToken ?? '');


      Get.to(() => WelcomeScreen());
      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: response.$1?['message'] ?? '');
      return;
    }

    CustomSnackBars.instance.showFailureSnackbar(
        title: 'Ohh', message: response.$1?['message'] ?? '');
  }

  login({required String password}) async {
    DialogService.instance.showProgressDialog();

    var body = {
      "phone": loginPhoneCtrl.text.trim(),
      "indicatif": signInCountryCode.value,
      "password": password
    };

    final res = await APIService.instance
        .post(signInUrl, body, true, successCode: 201, showResult: true);

    DialogService.instance.hideLoading();

    if (res.$1 != null && res.$2 == 201) {
      UserModel userModel = UserModel.fromJson(res.$1!);
      userModelGlobal.value = userModel.data?.user! ?? User();
      accessToken.value = userModel.data?.tokens?.accessToken ?? '';
      await showAccount();
      log('access:${accessToken.value.toString()}');
      Get.offAll(() => JelogoBottomBar(), binding: BottomBarBindings());
      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: res.$1?['message'] ?? '');
      await LocalStorageService.instance.write(
          key: 'accessToken', value: userModel.data?.tokens?.accessToken ?? '');

      await LocalStorageService.instance.write(
          key: 'password', value: password.toString());


      final pass = await LocalStorageService.instance.read(key: 'password');

      log('pass:${pass.toString()}');

      await SecureStorageService.instance.write(
          key: 'refreshToken',
          value: userModel.data?.tokens?.refreshToken ?? '');
      String token =
          await LocalStorageService.instance.read(key: 'accessToken');
      String? refreshToken =
          await SecureStorageService.instance.read(key: 'refreshToken');
      log('token:${token.toString()}');
      log('refreshToken:${refreshToken?.toString()}');
      return;
    }

    CustomSnackBars.instance
        .showFailureSnackbar(title: 'Ohh', message: res.$1?['message'] ?? '');
  }

  sendForgotPassOtp({bool resend = false, bool fromTransfer = false}) async {
    DialogService.instance.showProgressDialog();
    Map<String, dynamic> body = {
      "phone": forgetPassPhone.text.trim(),
      "countryCode": forgotPassCountryCode.value,
    };
    final response = await APIService.instance
        .post(forgotPassOtpUrl, body, true, showResult: true, successCode: 201);
    DialogService.instance.hideLoading();

    if (response.$1 != null && response.$2 == 201) {
      SendSignOtpModel sendSignOtpModel =
          SendSignOtpModel.fromJson(response.$1!);

      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: sendSignOtpModel.message ?? '');
      if (resend == false) {
        Get.to(() => TypeCode(
              fromTransfer: fromTransfer,
            ));
      }
      return;
    }
    CustomSnackBars.instance
        .showFailureSnackbar(title: 'Ohh', message: 'something went wrong');
  }

  resetPassword({bool fromTransfer = false}) async {
    DialogService.instance.showProgressDialog();
    String? token = await LocalStorageService.instance.read(key: 'accessToken');
    log('token:${token.toString()}');
    accessToken.value = token.toString();
    log('token:${accessToken.value.toString()}');

    var body = {
      "phone": forgetPassPhone.text.trim(),
      "countryCode": forgotPassCountryCode.value.toString(),
      "password": forgotSecretCodeController.text.trim(),
      "code": forgotPassCodeCtrl.text.trim(),
    };

    log('body:${body.toString()}');

    final res = await APIService.instance
        .post(resetPassUrl, body, true, showResult: true, successCode: 201);
    await LocalStorageService.instance.write(
        key: 'password', value: forgotSecretCodeController.text.trim());
    User user = User.fromJson(res.$1!['data']);
    userModelGlobal.value = user;
    if (res.$1 != null && res.$2 == 201) {
      Get.to(() => ChangePasswordSuccess(
            fromTransfer: fromTransfer,
          ));
      CustomSnackBars.instance.showSuccessSnackbar(
          title: 'Success', message: res.$1?['message'] ?? '');
      return;
    }

    CustomSnackBars.instance
        .showFailureSnackbar(title: 'Ohh', message: res.$1?['message'] ?? '');
  }
}
