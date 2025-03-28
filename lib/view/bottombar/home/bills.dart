import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/view/bottombar/home/add_bill_detail.dart';
import 'package:jelogo/widgets/appbar.dart';

import '../../../constants/assets_images.dart';
import 'invoice-payment/transport.dart';
class Bills extends StatelessWidget {
   Bills({super.key});
  final List<Map<String, dynamic>> listItems = [
    {
      "icon": AssetsImages.canal,
      "label": "Canal +",
      "route": () {
        Get.to(()=> AddBillDetail(bgColor: Colors.black, title: 'Canal +'));
      },
    },
    {
      "icon": AssetsImages.cie,
      "label": "CIE",
      "route":  () {

        Get.to(()=> AddBillDetail(bgColor: Colors.orange, title: 'CIE'));

      },
    },
    {
      "icon": AssetsImages.sodeci,
      "label": "SODECI",
      "route":  () {

        Get.to(()=> AddBillDetail(bgColor: Colors.green, title: 'SODECI'));
      },
    },
    {
      "icon": AssetsImages.ponthkb,
      "label": "Pont HKB",
      "route":  () {
        Get.to(()=> AddBillDetail(bgColor: Colors.green, title: 'Pont HKB'));
      },
    },
    {
      "icon": AssetsImages.star_times,
      "label": "Star Times",
      "route":  () {
        Get.to(()=> AddBillDetail(bgColor: Colors.orange, title: 'Star Times'));
      },
    },
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(
        title: 'Bills'
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap:true,
              itemCount: listItems.length,
              itemBuilder: (context, index) {
                return ReusableCard(

                    imagePath: listItems[index]['icon'],
                    title: listItems[index]['label'],
                    onTap: listItems[index]['route']);
              },)
          ],
        ),
      ),
    );
  }
}
