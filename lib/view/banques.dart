import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/assets_images.dart';
import 'package:jelogo/controller/transfer_controller.dart';
import 'package:jelogo/view/auth/pin_screen.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/blue_button.dart';

import '../widgets/my_text_field_widget.dart';
import 'bottombar/home/invoice-payment/transport.dart';
class Banques extends StatelessWidget {

  const Banques({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: simpleAppBar(title: 'Banques'),
       body: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
       child: Column(
         children: [

           ReusableCard(
               imagePath: AssetsImages.visa,
               title: 'depuis un compte VISA',
               onTap: () {

                 Get.to(()=> BenquesDetail());

               },),
           ReusableCard(
             imagePath: AssetsImages.logo,
             title: 'depuis un compte JELOGO',
             onTap: () {
               Get.to(()=> BenquesDetail());
             },),


         ],
       ),


       ),
    );
  }
}

class BenquesDetail extends StatelessWidget {
   BenquesDetail({super.key});
  final _transferController = Get.find<TransferController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Banques Detail'),
      body:Padding( padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
         key: _formKey,
          child: Column(
            children: [

              MyTextField(
                controller: _transferController.accountNoCtrl,
                labelText: 'Account Name',
              ),
              MyTextField(
                labelText: 'IBAN',
                controller: _transferController.ibanCtrl,
              ),
              MyTextField(
                labelText: 'Amount',
                controller: _transferController.amountCtrl,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 20.h,),

              BlueButton(ButtonText: 'Confirm', onTap: () {

                if(!_formKey.currentState!.validate())
                {
                  return;
                }
                Get.to(()=> PinScreen(
                  fromTransfer: true,
                isFee: false,
                slug: "Mastercard",));
              },)

            ],
          ),
        ),

      ),
    );
  }
}