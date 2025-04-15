import 'package:get/get.dart';
import 'package:jelogo/api/api_service.dart';
import 'package:jelogo/core/constants/endpoints.dart';
import 'package:jelogo/utils/dialogs.dart';

import '../model/user/user_model.dart';
import '../utils/global_instances.dart';

class HomeController extends GetxController{
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
}