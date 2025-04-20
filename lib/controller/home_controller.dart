import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/model/wallet/wallet_balance.dart';
import 'package:jelogo/utils/dialogs.dart';

import '../model/user/user_model.dart';
import '../utils/global_instances.dart';
import '../utils/snackbars.dart';

class HomeController extends GetxController{


  Rx<WalletBalance> walletBalance = WalletBalance().obs;

  Future<bool> showAccount() async {
    DialogService.instance.showProgressDialog();

    final res = await APIService.instance.
    get(showAccountUrl, false);
    DialogService.instance.hideLoading();
    if (res.$1 != null && res.$2 == 200) {
      UserModel userModel = UserModel.fromJson(res.$1 as Map<String, dynamic>);
      userModelGlobal.value = userModel.data?.user! ?? User();
      return true;
    }

    return false;
  }

  Future<void> showWalletBalance() async {

    /// Show loading dialog

  //  DialogService.instance.showProgressDialog();

    final response = await APIService.instance.get(showWalletBalanceUrl, false);

    /// Hide loading dialog

   // DialogService.instance.hideLoadFing();

    final data = response.$1;
    final statusCode = response.$2;

    if (data != null && statusCode == 200) {
      if (data['status'] == true) {
        walletBalance.value = WalletBalance.fromJson(data as Map<String,dynamic>);

      } else {
        CustomSnackBars.instance.showToast(message: data['error'] ?? 'Unknown error');
      }

      return;
    }

    CustomSnackBars.instance.showFailureSnackbar(
      title: 'Alert',
      message: 'Something went wrong in getting nearby vendors',
    );
  }


  @override
  void onReady() {
    showWalletBalance();
    super.onReady();
  }

}