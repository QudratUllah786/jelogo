import 'dart:developer';

import 'package:get/get.dart';
import 'package:jelogo/core/constants/endpoints.dart';

import '../api/api_service.dart';
import '../model/document/document_model.dart';
import '../utils/dialogs.dart';
import '../utils/snackbars.dart';

class CardController extends GetxController {
  RxList<DocumentModel> documentList = <DocumentModel>[].obs;
  var picture = ''.obs;
  var frontCni = ''.obs;
  var backCni = ''.obs;
  var docTypeId = ''.obs;

  Future<void> getAllDocuments() async {
    /// Show loading dialog

    documentList.clear();
    DialogService.instance.showProgressDialog();

    final response = await APIService.instance.get(getAllDocUrl, false);

    /// Hide loading dialog

    DialogService.instance.hideLoading();

    final data = response.$1;
    final statusCode = response.$2;

    log('res:$response');

    if (data != null && statusCode == 200) {
      if (data['status'] == true) {
        for (var i in data['data']) {
          DocumentModel documentModel = DocumentModel.fromJson(i);
          documentList.add(documentModel);
        }
      } else {
        CustomSnackBars.instance
            .showToast(message: data['error'] ?? 'Unknown error');
      }
      return;
    }

    CustomSnackBars.instance.showFailureSnackbar(
      title: 'Alert',
      message: 'Something went wrong in getting nearby vendors',
    );
    return;
  }


  Future<void> createOrderCard() async {

    DialogService.instance.showProgressDialog();


    log('frontImage:${frontCni.value.toString()}');
    log('backImage:${backCni.value.toString()}');
    log('Image:${picture.value.toString()}');

    final data = await APIService.instance.postOrderCard(
        createOrderUrl,
        docTypeId.value,
        frontCni.value,
        backCni.value,
        picture.value);

    log('data:${data}');

DialogService.instance.hideLoading();
    if(data.$1 != null && data.$2 == 201 ){

      if(data.$1?['status'] == true ){

        CustomSnackBars.instance.showSuccessSnackbar(title: 'Success', message: data.$1?['message']);
        Get.close(1);

      }else{
        CustomSnackBars.instance.showFailureSnackbar(title: 'Failure', message: data.$1?['message']);
      }



      return;
    }


    CustomSnackBars.instance.showFailureSnackbar(title: 'Failure', message: data.$1?['message']);
    return;
  }
  
  
  
  

  @override
  void onReady() {
    getAllDocuments();
    super.onReady();
  }
}
