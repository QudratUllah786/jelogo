import 'package:get/get.dart';
import '../model/user/user_model.dart';

Rx<User> userModelGlobal = User().obs;
var accessToken = ''.obs;
