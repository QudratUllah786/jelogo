import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../controller/transfer_controller.dart';

class Beneficiary extends StatelessWidget {
   Beneficiary({super.key});
  final transferController = Get.find<TransferController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Beneficiary',centerTitle: true),
      body: Obx(
        () =>


          transferController.myBeneficiaryList.isNotEmpty?  ListView.builder(

          itemCount: transferController.myBeneficiaryList.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: AppSizes.HORIZONTAL,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    transferController.phoneCtrl.text = transferController.myBeneficiaryList[index].phone??'';
                    Get.close(1);
                  },
                  leading:  CircleAvatar(
                    radius: 30.sp,
                    child: Icon(Icons.person_outline),
                    //  backgroundImage: NetworkImage(beneficiary["image"]!),
                  ),
                  title: MyText(text: transferController.myBeneficiaryList[index].name??'',size: 14.sp,
                  weight: FontWeight.w500,

                  ),
                ),
                Divider()
              ],
            ),
          );
        },):
        Center(
          child: MyText(text: 'No beneficiary'),
        ),
      ),
    );
  }
}
