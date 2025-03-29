import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widgets/alert_dialog_box.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/my_text.dart';
class Merchants extends StatelessWidget {
   Merchants({super.key});


 final List merchants = ['Identifiant du Marchand'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Merchands',
        bgColor: Colors.black,
        centerTitle: true,
        titleColor: Colors.white,
        haveLeading: false,
      ),
      body: PopScope(
        canPop: false, // Prevent default back behavior
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.close(1); // Close two screens when back button is pressed
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: ListView.builder(
            itemCount: merchants.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            message: "Le service est indisponible pour l'instant !!!",
                            // Other optional parameters can be set here
                          );
                        },
                      );


                    },
                    title: MyText(text: merchants[index], weight: FontWeight.w500),
                    trailing: Icon(
                      Icons.navigate_next_outlined,
                      size: 30.sp,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
