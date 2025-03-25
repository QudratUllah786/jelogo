import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jelogo/constants/app_Colors.dart';

import 'my_text.dart';

class MyPhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String?)? onSubmitted;
  final GlobalKey<FormState> formKey;

  MyPhoneTextField({
    super.key,
    required this.formKey,
    this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Type your phone number',
          size: 12,
          color: kSubheadingColor,
          weight: FontWeight.w700,
        ),
        SizedBox(height: 8),
        Form(
          key: formKey,
          child: IntlPhoneField(
            onSubmitted: onSubmitted,
            controller: controller,
            cursorColor: kSecondaryColor,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
            showCountryFlag: true,
            flagsButtonPadding: EdgeInsets.symmetric(horizontal: 10),
            showDropdownIcon: true,
            dropdownIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black54,
              size: 20,
            ),

            decoration: InputDecoration(

              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: kBordercolor,
                ),
                borderRadius: BorderRadius.circular( 12.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular( 12.sp),
                borderSide: BorderSide(
                  width: 1,
                  color: kBordercolor,
                ),
              ),
              hintText: 'Enter phone number',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            onCountryChanged: (country) {
              // Handle country code change
            },
          ),
        ),
      ],
    );
  }
}
