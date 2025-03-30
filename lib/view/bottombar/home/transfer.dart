import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/view/auth/pin_screen.dart';
import 'package:jelogo/view/bottombar/home/confirm.dart';
import 'package:jelogo/widgets/blue_button.dart';
import 'package:jelogo/widgets/custom_dropdown.dart';
import 'package:jelogo/widgets/my_phone_widget.dart';
import 'package:jelogo/widgets/my_text.dart';
import 'package:jelogo/widgets/my_text_field_widget.dart';

import '../../../widgets/appbar.dart';
class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  bool isCheck = false;
  bool isCheck1 = false;
  String selectedOption = 'Orange Money';
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> beneficiaries = [
    {"name": "Emma", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY6qtMj2fJlymAcGTWLvNtVSCULkLnWYCDcQ&s"},
    {"name": "Justin", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY6qtMj2fJlymAcGTWLvNtVSCULkLnWYCDcQ&s"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Transfer',
        titleSize: 20,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              CustomDropdown(

                title: selectedOption, items: [
                'Orange Money',
                'Moov Money',
                'MTN Money',
                'Wave',
                'Jelogo'
              ],onChanged: (value) {

                  setState(() {
                    selectedOption = value!;
                  });


              },),
          
              SizedBox(height: 10,),
          
              CustomDropdown(title: 'Select Debit Account', items: [
                'Orange Money',
                'Moov Money'
              ],onChanged: (value) {

              },),
          
              SizedBox(height: 10,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(text: 'Choose beneficiary',
                  size: 12.sp,
                    weight: FontWeight.w600,
                    color: kSubheadingColor,
                  ),
          
          
                  MyText(text: 'Find beneficiary',
                    size: 12.sp,
                    weight: FontWeight.w600,
                  color: kSecondaryColor,
          
          
                  )
          
          
                ],
              ),
          
              SizedBox(height: 10,),
              Row(
                children: [
                  // Add Beneficiary Button
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      width: 100.w,
                      height: 120.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 40, color: Colors.white),
                      ),
                    ),
                  ),
          
                  // Beneficiary List (Limited to 2 items)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: beneficiaries.take(2).map((beneficiary) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Container(
                              width: 100.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30.sp,
                                  child: Icon(Icons.person_outline),
                                  //  backgroundImage: NetworkImage(beneficiary["image"]!),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    beneficiary["name"]!,
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
          
          
              SizedBox(height: 10,),
          
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // Soft shadow
                    blurRadius: 10, // Spread of the shadow
                    offset: Offset(2, 2), // Shadow position (X, Y)
                  ),
                ],
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                               //   mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //  MyTextField(hintText: 'Capi Creative Design'),


                    MyPhoneTextField(formKey: _formKey),

                //    MyTextField(hintText: '0123456789109', keyboardType: TextInputType.number),
                    MyTextField(hintText: 'Fcfa 1000'),
                    MyTextField(hintText: 'Fcfa 1000'),
                    MyText(
                      paddingLeft: 5.w,
                      text: 'One thousand Fcfa',
                      color: kSecondaryColor,
                      weight: FontWeight.w600,
                      size: 12.sp,
                    ),

                    Visibility(
                      visible: selectedOption == 'Jelogo'
                      ? false: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isCheck1 = !isCheck1;
                              });
                            },
                            icon: Icon(
                              isCheck1 ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                              color: isCheck1 ? kSecondaryColor : kTertiaryColor,
                            ),
                          ),
                          MyText(
                            text: 'I pay the fees 1.5%',
                            weight: FontWeight.w500,
                            size: 14.sp,
                          )
                        ],
                      ),
                    ),

                    Visibility(
                        visible: selectedOption == 'Jelogo',
                        child: Column(
                          children: [
                            SizedBox(height: 20.h,),
                            Center(child: MyText(text: 'Free Transfer',color:Colors.green,size: 20,weight: FontWeight.w600,textAlign: TextAlign.center,)),
                          ],
                        )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isCheck = !isCheck;
                            });
                          },
                          icon: Icon(
                            isCheck ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                            color: isCheck ? kSecondaryColor : kTertiaryColor,
                          ),
                        ),
                        MyText(
                          text: 'Save to directory of beneficiary ',
                          weight: FontWeight.w500,
                          size: 14.sp,
                        )
                      ],
                    ),


                    SizedBox(height: 10.h), // Add spacing before button
                    //
                    BlueButton(
                      ButtonText: 'Confirm',
                      onTap: () {

                      Get.to(()=> PinScreen(fromTransfer: true,));

                      },
                    ),
                  ],
                ),
              ),
            )
              
          
          
            ],
          ),
        ),
      ),
    );
  }
}
