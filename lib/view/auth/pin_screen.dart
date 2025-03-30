import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jelogo/constants/app_Colors.dart';
import 'package:jelogo/widgets/appbar.dart';

import '../../widgets/my_text.dart';
import '../bottombar/home/confirm.dart';
import '../bottombar/jelogo_bottom_bar.dart';

class PinScreen extends StatefulWidget {
  final bool? fromTransfer;
  final bool fromTopUp;

  const PinScreen({super.key, this.fromTransfer = false,this.fromTopUp = false});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pin = "";

  void _onNumberPress(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
      });

      if (pin.length == 4) {
        if (widget.fromTransfer == true) {
          Get.to(Confirm(topUp: widget.fromTopUp,));
          return;
        }

        Get.offAll(() => JelogoBottomBar());
      }
    }
  }

  void _onDelete() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
          title: 'JELOGO',
          haveLeading: false,
          bgColor: Colors.grey[200],
          centerTitle: true,
          actions: [
            Visibility(
              visible: widget.fromTransfer == true? false:true,
              child: MyText(
                text: 'Disconnection',
                color: Colors.redAccent,
                size: 14.sp,
                weight: FontWeight.w600,
                paddingRight: 10,
              ),
            )
          ]),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: "Enter your secret code",
              size: 18.sp,
              weight: FontWeight.w600,
            ),

            MyText(
              text: "Please enter your security code",
              size: 14,
              color: kSubheadingColor,
            ),
            SizedBox(
              height: 5.h,
            ),

            Icon(
              Icons.lock_outlined,
              color: Colors.black,
              size: 40.sp,
            ),

            SizedBox(height: 40.sp),

            /// Dots for entered PIN
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 50.w,
                  // Adjust width
                  height: 50.h,
                  // Adjust height
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                    color:
                        index < pin.length ? Colors.black : Colors.transparent,
                  ),
                  child: Text(
                    index < pin.length ? pin[index] : "",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: index < pin.length ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),

            MyText(
              text: "Forgotten secret code",
              size: 14,
              color: Colors.lightBlue,
            ),

            Spacer(),

            /// Number Pad
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  List<String> keys = [
                    "9",
                    "7",
                    "5",
                    "8",
                    "3",
                    "0",
                    "2",
                    "6",
                    "꩜",
                    "1",
                    "4",
                    "⌫"
                  ];

                  return InkWell(
                    onTap: () {
                      if (keys[index] == "꩜") {
                        // Handle fingerprint
                      } else if (keys[index] == "⌫") {
                        _onDelete();
                      } else {
                        _onNumberPress(keys[index]);
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    // Gives a nice ripple effect
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity, // Ensures it takes full space
                      height: double.infinity, // Ensures it takes full space
                      child: Text(
                        keys[index],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}
