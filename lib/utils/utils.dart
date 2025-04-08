import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/my_phone_widget.dart';

import '../widgets/my_text.dart';
 void showPurchaseBottomSheet(BuildContext context, String planDetails,GlobalKey<FormState> formKey) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             MyText(
             text: "Confirmer l'achat du forfait suivant :",
              size: 16.sp,
            ),
            const SizedBox(height: 8),
            MyText(
              text:  planDetails,
              size: 18.sp, weight: FontWeight.bold),

            const SizedBox(height: 16),
            Row(
              children: [
                Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                 MyText(text:"Confirmer pour soi même"),
              ],
            ),
            Row(
              children: [
                Radio(value: 2, groupValue: 1, onChanged: (value) {}),
                 MyText(text:"Confirmer pour un(e) autre"),
              ],
            ),
            const SizedBox(height: 8),
          MyPhoneTextField(formKey: formKey),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: BlueButton(ButtonText: 'Confirm', onTap: () {
                Get.close(4);
              },)
            ),
          ],
        ),
      );
    },
  );
}



