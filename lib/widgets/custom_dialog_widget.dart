import 'package:flutter/material.dart';

import '../constants/app_Colors.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final double? horizontalMargin, height;
  const CustomDialog({
    super.key,
    required this.child,
    this.horizontalMargin = 24,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin!),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
