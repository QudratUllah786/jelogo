import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jelogo/constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'my_text.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
        this.controller,
        this.keyboardType,
        this.hintText,
        this.marginBottom = 12,
        this.isObSecure = false,
        this.maxLength,
        this.maxLines = 1,
        this.isEnabled = true,
        this.labelText,
        this.suffixIcon,
        this.validator,
        this.onTap,
        this.haveSuffix = false,
        this.onChanged,
        this.suffixIconSize,
        this.onSuffixTap,
        this.focusBorderColor,
        this.radius,
        this.prefixIcon,
        this.havePrefix = false,
        this.onPrefixTap,
        this.fillColor,
        this.hintColor,
        this.readOnly,
        this.lableColor});
  String? hintText, labelText ;
  Icon ?suffixIcon;
  bool?  readOnly;
  double? marginBottom, suffixIconSize, radius, prefixIconSize;
  bool? isObSecure, isEnabled, haveSuffix, havePrefix;
  int? maxLength, maxLines;
  VoidCallback? onSuffixTap, onPrefixTap;
  Color? focusBorderColor, fillColor, hintColor, lableColor;

  TextInputType? keyboardType;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  VoidCallback? onTap;
  IconData? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: marginBottom!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText!,
              size: 12.sp,
              weight: FontWeight.w600,
              color: lableColor ?? kSubheadingColor,
              paddingBottom: 3,
              fontFamily: AppFonts.POPPINS,
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 24),
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.03),
                  blurRadius: 47,
                  offset: const Offset(-2, 6),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: kSecondaryColor,
              onTap: onTap,
              enabled: isEnabled,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              readOnly: readOnly?? false,
              maxLines: maxLines,
              maxLength: maxLength,
              onChanged: onChanged,
              obscureText: isObSecure!,
              obscuringCharacter: '*',
              controller: controller,
              textInputAction: TextInputAction.next,
              textAlignVertical:
              suffixIcon != null ? TextAlignVertical.center : null,
              // prefixIcon != null ? TextAlignVertical.center : null,

              keyboardType: keyboardType,
              style: TextStyle(
                fontSize: 15.5.sp,
                color: kTertiaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.POPPINS,
              ),
              decoration: InputDecoration(
                fillColor: fillColor ?? kFillColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: maxLines! > 1 ? 15 : 0,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: hintColor ?? khintColor,
                  fontFamily: AppFonts.POPPINS,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: haveSuffix! ? 40 : 16,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: havePrefix! ? 43 : 14,
                ),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (haveSuffix!)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 2.w,
                        ),
                        child: GestureDetector(
                          onTap: onSuffixTap,
                          child: suffixIcon
                        ),
                      ),
                  ],
                ),
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (havePrefix!)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 2.w,
                        ),
                        child: GestureDetector(
                            onTap: onPrefixTap,
                            child: Icon(
                              prefixIcon!,
                              color:hintColor?? kBrown,
                            )),
                      ),
                  ],
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: focusBorderColor ?? kBordercolor,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 12.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 12.sp),
                  borderSide: BorderSide(
                    width: 1,
                    color: focusBorderColor ?? kBordercolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/////////////////////DROPDOWN TEXTFIELD
class MyDropdown extends StatefulWidget {

  @override
  _MyDropdownState createState() => _MyDropdownState(


  );
}

class _MyDropdownState extends State<MyDropdown> {
  String _selectedValue='Road Trip';

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MyText(
          text: 'Trip Title',
          size: 17.sp,
          weight: FontWeight.w700,
          color: kSecondaryColor,
          paddingBottom: 3,
          fontFamily: AppFonts.POPPINS,
        ),
        DropdownButtonFormField<String>(
          elevation: 0,
          isDense: true,
          focusColor: kFillColor,
          decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric( horizontal: 3.w,
                  vertical:1.65.h),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: kBordercolor,
                ),
                borderRadius: BorderRadius.circular(12.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: const BorderSide(
                  width: 1,
                  color: kBordercolor,
                ),
              ),
              fillColor: kFillColor,
              filled: true),
          value: _selectedValue,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down,color: khintColor,),
          iconSize: 20.sp,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
          items: <String>['Road Trip', 'One Way']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              enabled: true,
              child: MyText(
                text: value,
                size: 16.sp,
                color: khintColor,
                fontFamily: AppFonts.POPPINS,
              ),
            );
          }).toList(),
          dropdownColor: kFillColor,
        ),
      ],
    );
  }
}
///

class From_date extends StatefulWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;

  const From_date({
    super.key,
    this.onDateSelected,
    this.selectedDate,
    required this.label,
  });

  @override
  State<From_date> createState() => _From_dateState();
}

class _From_dateState extends State<From_date> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12), // Same as MyTextField
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.label.isNotEmpty)
            MyText(
              text: widget.label,
              size: 12.sp,
              weight: FontWeight.w600,
              color: kSubheadingColor,
              paddingBottom: 3,
              fontFamily: AppFonts.POPPINS,
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), // Same as MyTextField
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.03),
                  blurRadius: 47,
                  offset: const Offset(-2, 6),
                ),
              ],
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: 15.5.sp,
                color: kTertiaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.POPPINS,
              ),
              controller: dateinput,
              cursorColor: kSecondaryColor,
              readOnly: true,
              decoration: InputDecoration(
                fillColor: kFillColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 15,
                ),
                hintText: 'DD/MM/YYYY',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: khintColor,
                  fontFamily: AppFonts.POPPINS,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 40,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: GestureDetector(
                    onTap: _selectDate,
                    child: Icon(
                      Icons.calendar_today_outlined,
                      color: khintColor,
                    ),
                  ),
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kBordercolor,
                  ),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(
                    width: 1,
                    color: kBordercolor,
                  ),
                ),
              ),
              onTap: _selectDate,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(() {
        dateinput.text = formattedDate;
      });

      if (widget.onDateSelected != null) {
        widget.onDateSelected!(pickedDate);
      }
    }
  }
}



class CustomTextField4 extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final String hintText;
  final bool isIcon;
  final bool? readOnly;
  final int maxLines;
  final bool isTime;
  final bool isDate;

  final Widget? suffix;

  final String? Function(String?)? validator;

  const CustomTextField4(
      {Key? key,
        this.onChanged,
        this.isTime = false,
        this.isDate = false,
        this.readOnly = false,
        this.controller,
        required this.labelText,
        this.hintText = 'Enter here',
        this.isIcon = false,
        this.validator,
        this.suffix,
        this.keyboardType,
        this.maxLines = 1,
        this.onTap})
      : super(key: key);

  @override
  State<CustomTextField4> createState() => _CustomTextField4State();
}

class _CustomTextField4State extends State<CustomTextField4> {
  bool _isObscure = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        widget.controller?.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    log('time:${widget.controller?.text}');
    if (picked != null) {
      setState(() {
        widget.controller?.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffCFC8E4),
          width: 1.w,
        ),
        color: Color(0xfffafafc),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: () {
            if (widget.isDate) {
              autovalidateMode:
              AutovalidateMode.onUserInteraction;

              _selectDate(context);
            }
            if (widget.isTime) {
              _selectTime(context);
            }
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          keyboardType: widget.keyboardType ?? TextInputType.text,
          readOnly: widget.readOnly ?? false,
          validator: widget.validator,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isIcon ? _isObscure : false,
          maxLines: widget.maxLines,
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            alignLabelWithHint: widget.maxLines == 1 ? false : true,
            border: InputBorder.none,
            label: Align(
                alignment: Alignment.topLeft,
                child: MyText(
                  text: widget.labelText,
                  color: Color(0xff9e9e9e),
                  size: 18,
                  weight: FontWeight.w500,
                )),
            // suffix: widget.suffix,
            suffixIcon: widget.isIcon
                ? IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
              ),
              iconSize: 18,
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            )
                : widget.suffix,
          ),
        ),
      ),
    );
  }
}


/*

class TimePicker extends StatefulWidget {
  final String label;
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay)? onTimeSelected;
  const TimePicker({
    super.key,
    this.onTimeSelected,
    this.selectedTime,
    required this.label,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    timeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          text: widget.label,
          size: 17.sp,
          weight: FontWeight.w700,
          color: kSecondaryColor,
          paddingBottom: 3,
          fontFamily: AppFonts.URBANIST,
        ),
        TextFormField(
          style: TextStyle(
            fontSize: 15.5.sp,
            color: kSecondaryColor,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.URBANIST,
          ),
          cursorColor: kSecondaryColor,
          showCursor: true,
          decoration: InputDecoration(
            hintText: 'HH:MM',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: khintColor,
              fontFamily: AppFonts.URBANIST,
            ),
            labelStyle: const TextStyle(color: Color.fromRGBO(72, 71, 71, 1)),
            fillColor: kFillColor,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.65.h),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kBordercolor, width: 1),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kBordercolor, width: 1),
              borderRadius: BorderRadius.circular(12.sp),
            ),
          ),
          controller: timeInput,
          readOnly: true,
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: widget.selectedTime ?? TimeOfDay.now(),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData(
                    colorScheme: const ColorScheme(
                      primary: kPinFillcolor,
                      onPrimary: kPrimaryColor,
                      onPrimaryContainer: kSecondaryColor,
                      secondary: kSecondaryColor,
                      onSecondary: kSecondaryColor,
                      surface: kPrimaryColor,
                      onSurface: kSecondaryColor,
                      background: kPrimaryColor,
                      onBackground: kSecondaryColor,
                      error: kRed,
                      onError: kPrimaryColor,
                      brightness: Brightness.light,
                    ),
                    dialogBackgroundColor: kPrimaryColor,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: kSecondaryColor,
                      ),
                    ),
                    textTheme: TextTheme(
                      headlineMedium: TextStyle(
                        fontSize: 15.5.sp,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.URBANIST,
                      ),
                      titleMedium: TextStyle(
                        fontSize: 15.5.sp,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.URBANIST,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedTime != null) {
              String formattedTime = pickedTime.format(context);
              timeInput.text = formattedTime;

              // Call the callback function with the selected time
              if (widget.onTimeSelected != null) {
                widget.onTimeSelected!(pickedTime);
              }
            }
          },
        ),
      ],
    );
  }
}*/



