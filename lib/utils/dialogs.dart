import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jelogo/widgets/blue_button.dart';

import '../constants/app_Colors.dart';
import '../widgets/custom_dialog_widget.dart';
import '../widgets/my_text.dart';

class DialogService {
  // Private constructor
  DialogService._privateConstructor();

  // Singleton instance variable
  static DialogService? _instance;

  //This code ensures that the singleton instance is created only when it's accessed for the first time.
  //Subsequent calls to DialogService.instance will return the same instance that was created before.

  // Getter to access the singleton instance
  static DialogService get instance {
    _instance ??= DialogService._privateConstructor();
    return _instance!;
  }

  void showProgressDialog() {
    //showing progress indicator
    Get.dialog(WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
            child: CircularProgressIndicator(
          color: kSecondaryColor,
        ))));
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (_) => );
  }
  //
  // permissionDialogue(
  //     {required String message, required VoidCallback onSubmit}) {
  //   return CustomDialog(
  //       child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       MyText(
  //         text: message,
  //         size: 16,
  //         textAlign: TextAlign.center,
  //         color: kSubheadingColor,
  //         paddingBottom: 12,
  //       ),
  //       Row(
  //         children: [
  //           Expanded(
  //             child: BlueButton(
  //               backgroundColor: kGreyColor3,
  //               textColor: kBlackColor,
  //               buttonText: 'Cancel',
  //               onTap: () {
  //                 Get.back();
  //               },
  //             ),
  //           ),
  //           SizedBox(
  //             width: 12,
  //           ),
  //           Expanded(
  //             child: MyButton(
  //               bgColor: kRedColor,
  //               buttonText: 'Submit',
  //               onTap: onSubmit,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ));
  // }

  void hideLoading() {
    Get.back();
  }
}
