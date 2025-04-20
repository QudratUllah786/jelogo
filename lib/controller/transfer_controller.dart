import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/utils/dialogs.dart';

import '../utils/snackbars.dart';

class TransferController extends GetxController{


  TextEditingController amountCtrl = TextEditingController();
  TextEditingController ibanCtrl = TextEditingController();
  TextEditingController accountNoCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  Future<bool> paymentTransfer({required bool withFee,required String slug}) async {

    DialogService.instance.showProgressDialog();


    var body = {

      "amount": amountCtrl.text.trim(),
      "amountToPay": amountCtrl.text.trim(),
      "withFee": withFee,
      "operatorSlug": slug,
      "phoneNumber":phoneCtrl.text.trim(),
      "transactionTypeSlug": "TRANSFERT"


    };


    final data = await APIService.instance.post(paymentTransferUrl, body, false);

    log('data:${data}');

    DialogService.instance.hideLoading();
    if(data.$1 != null && data.$2 == 201 ){

      if(data.$1?['status'] == true ){

        CustomSnackBars.instance.showSuccessSnackbar(title: 'Success', message: data.$1?['message']);
        Get.close(1);
        return true;

      }else{
        CustomSnackBars.instance.showFailureSnackbar(title: 'Failure', message: data.$1?['message']);
      }



      return false;
    }


    CustomSnackBars.instance.showFailureSnackbar(title: 'Failure', message: data.$1?['message']);
    return false;
  }







}