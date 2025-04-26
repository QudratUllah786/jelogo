import 'dart:developer';

import 'package:get/get.dart';
import 'package:jelogo/model/transaction_model/transaction_model.dart';
import 'package:jelogo/view/bottombar/home/transcation_detail.dart';

import '../api/api_service.dart';
import '../core/constants/endpoints.dart';
import '../utils/dialogs.dart';

class TransactionController extends GetxController{

  RxList<TransactionModel> myTransactions = <TransactionModel>[].obs;

  getMyTransactions() async{

    myTransactions.clear();
    DialogService.instance.showProgressDialog();

    final data =  await APIService.instance.get(myTransactionUrl,false);

    DialogService.instance.hideLoading();

    if(data.$1 != null && data.$2 == 200 ){

      if(data.$1?['status'] == true ){

        log(data.$1?['message']);
        log('message:${data.$1?['data']}');
        for(var i in data.$1?['data']){
          TransactionModel transactionModel = TransactionModel.fromJson(i);
          myTransactions.add(transactionModel);
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
    getMyTransactions();
    super.onReady();
  }

}