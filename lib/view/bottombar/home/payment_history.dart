import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/constants/app_sizes.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/controller/transaction_controller.dart';
import 'package:jelogo/enum/transaction_enum.dart';
import 'package:jelogo/view/bottombar/home/transcation_detail.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/my_text.dart';

import '../../../core/common/functions.dart';
import '../../../widgets/general_image_widget.dart';
class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});


   static const List<String> monthsList = [
    'Jan 2025',
    'Dec 2024',
    'Nov 2024',
    'Oct 2024',
    'Sep 2024',
    'Aug 2024',
  ];

  static const List<Map<String, dynamic>> transactions = [
    {"amount": "+50 Fcfa", "date": "10/01/2025 22:20", "isPositive": true},
    {"amount": "-50 Fcfa", "date": "10/01/2025 22:20", "isPositive": false},
    {"amount": "+50 Fcfa", "date": "10/01/2025 22:20", "isPositive": true},
    {"amount": "+50 Fcfa", "date": "10/01/2025 22:20", "isPositive": true},
    {"amount": "+50 Fcfa", "date": "10/01/2025 22:20", "isPositive": true},
  ];

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final _transactionController =Get.find<TransactionController>();
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Payment history'),
      body: Padding(
        padding:EdgeInsets.only(left: 16.w,top: 10.h),
        child: Column(
          children: [
            // SizedBox(
            //   height: 50.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemCount: PaymentHistory.monthsList.length,
            //     itemBuilder:  (context, index) {
            //       bool isSelected = selectedMonthIndex == index;
            //     return Padding(
            //       padding:  EdgeInsets.only(right: 5.w),
            //       child: InkWell(
            //         onTap: () {
            //           setState(() {
            //             selectedMonthIndex = index;
            //           });
            //         },
            //         child: Container(
            //           alignment: Alignment.center,
            //           width: 100.w,
            //           height: 44.h,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15.sp),
            //             color: isSelected? kSecondaryColor:kLoginButtonColor ,
            //           ),
            //           child: MyText(text:PaymentHistory.monthsList[index],color:isSelected? kPrimaryColor:kTertiaryColor,
            //             size: 15.sp,weight: FontWeight.w500,),
            //         ),
            //       ),
            //     );
            //   },),
            // ),
            //
            // SizedBox(height: 30.h,),

            Obx(
              () =>


                _transactionController.myTransactions.isEmpty?

                    Center(
                      child: MyText(text: 'no transaction history'),
                    ):

                ListView.builder(
                padding:EdgeInsets.only(right: 16.w) ,
                shrinkWrap: true,
                itemCount: _transactionController.myTransactions.length,
                itemBuilder:(context, index) {
                return PaymentTile(
                   paymentType: _transactionController.myTransactions[index].action == TransactionEnum.TRANSFER_TO_WALLET.name ? 'Transfer':'Deposit',
                  onTap: () {
                    Get.to(()=>TransactionDetail(
                      transactionModel:  _transactionController.myTransactions[index],
                        isPositive: _transactionController.myTransactions[index].status == TransactionEnum.COMPLETED.name));
                  },
                amount:_transactionController.myTransactions[index].amount?.toString() ??'',
                date: formatDateTime(_transactionController.myTransactions[index].createdAt.toString()),
                isPositive: _transactionController.myTransactions[index].status == TransactionEnum.COMPLETED.name,
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}


class PaymentTile extends StatelessWidget {
  final String amount;
  final String date;
  final bool isPositive;
  final String paymentType;
final void Function()? onTap;

  const PaymentTile({super.key,
    required this.amount,
    required this.paymentType,
    required this.onTap,
    required this.date,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [


            Container(
              decoration: BoxDecoration(
                color: kLoginButtonColor, // Background color for the icon
                borderRadius: BorderRadius.circular(12.sp), // Responsive border radius
              ),
              alignment: Alignment.center,
              width: 50.w, // Responsive width
              height: 50.h, // Responsive height
              child: GeneralImageWidget(
                width: 38.w,
                height: 12.h,
                imagePath: AssetsImages.logo,
              ),
            ),




            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   MyText(text: paymentType,size: 16.sp,weight: FontWeight.w600,),
                  Text(date, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),

            SizedBox(width: 5.w,),

            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}