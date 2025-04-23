import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/model/beneficiary_model.dart';
import 'package:jelogo/utils/dialogs.dart';

import '../utils/snackbars.dart';

class TransferController extends GetxController{


  TextEditingController amountCtrl = TextEditingController();
  TextEditingController ibanCtrl = TextEditingController();
  TextEditingController accountNoCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  RxDouble amountInPercent = 0.0.obs;
  RxString amountToSend = "0".obs;
  RxList<BeneficiaryModel> myBeneficiaryList = <BeneficiaryModel>[].obs;

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




  Future<void> addBeneficiary ({required String name}) async{
    
    DialogService.instance.showProgressDialog();

    var body =
    {
      "name": name,
      "phone": phoneCtrl.text.trim(),
      "countryCode": '225',
      "beneficiaryType": "WALLET"
    };
    final data =  await APIService.instance.post(addBeneficiaryUrl, body, false);

         DialogService.instance.hideLoading();

    if(data.$1 != null && data.$2 == 201 ){

      if(data.$1?['status'] == true ){

        log(data.$1?['message']);
        CustomSnackBars.instance.showSuccessSnackbar(title: 'Success', message: data.$1?['message']);

      }else{
        log(data.$1?['message']);
      }

      return;
    }

    log('something went wrong');
    
  }





  Future<void> getMyBeneficiary () async{

    DialogService.instance.showProgressDialog();


    final data =  await APIService.instance.get(getMyBeneficiaryUrl,false);

    DialogService.instance.hideLoading();

    if(data.$1 != null && data.$2 == 200 ){

      if(data.$1?['status'] == true ){

        log(data.$1?['message']);
        for(var i in data.$1?['data']){
          BeneficiaryModel beneficiaryModel = BeneficiaryModel.fromJson(i);
          myBeneficiaryList.add(beneficiaryModel);
        }

       // CustomSnackBars.instance.showSuccessSnackbar(title: 'Success', message: data.$1?['message']);

      }else{
        log(data.$1?['message']);
      }

      return;
    }

    log('something went wrong');

  }



@override
  void onReady() {
    getMyBeneficiary();
    super.onReady();
  }

}