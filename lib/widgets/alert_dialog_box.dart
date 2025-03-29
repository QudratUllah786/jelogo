import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_text.dart';

/// A reusable custom alert dialog widget
class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const CustomAlertDialog({
    super.key,
    this.title = 'Alert',
    required this.message,
    this.buttonText = 'OK',
    this.onButtonPressed,
  });

  /// Show this dialog using a static method for convenience
  static Future<void> show({
    required BuildContext context,
    String title = 'Alert',
    required String message,
    String buttonText = 'OK',
    VoidCallback? onButtonPressed,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title,
          message: message,
          buttonText: buttonText,
          onButtonPressed: onButtonPressed,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: MyText(
       text: title,
        size: 24.sp,
          weight: FontWeight.bold,
        ),

      content: MyText(
      text:  message,
          size: 16.sp,

      ),
      actions: [
        TextButton(
          onPressed: onButtonPressed ?? () {
            Navigator.of(context).pop();
          },
          child: MyText(
           text: buttonText,

              size: 16.sp,
            weight: FontWeight.bold,
              color: Colors.black,

          ),
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 8),
    );
  }
}