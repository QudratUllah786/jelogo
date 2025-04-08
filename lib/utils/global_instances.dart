import 'package:get/get.dart';
import '../model/user/user_model.dart';

Rx<UserModel> userModelGlobal = UserModel().obs;
var accessToken = ''.obs;
