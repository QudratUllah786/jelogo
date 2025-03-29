import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/my_text.dart';

class OrangeMoney extends StatefulWidget {
  const OrangeMoney({super.key,required this.bgColor,required this.titleColor,required this.title});
  final Color titleColor;
  final Color bgColor;
  final String title;

  @override
  State<OrangeMoney> createState() => _OrangeMoneyState();
}

class _OrangeMoneyState extends State<OrangeMoney> {
  Map<String, dynamic> orange = {
    'Pass Mix': [
      '1 to 3 day pass',
      'Week Pass',
      'Month Pass',
    ],
    'Pass Internet': [
      '1 to 3 day pass',
      'Week Pass',
      'Month Pass',
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String> keys = orange.keys.toList(); // Convert map keys to list

    return Scaffold(
      appBar: simpleAppBar(
        title: widget.title,
        bgColor: widget.bgColor,
        centerTitle: true,
        titleColor: widget.titleColor,
        haveLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: ListView.builder(
          itemCount: orange.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(()=> OrangeMoneyDetail(
                      title: widget.title,
                        moneyList: orange[keys[index]],
                    titleColor:widget.titleColor ,
                      bgColor: widget.bgColor,

                    ),

                    );
                  },
                  title: MyText(text: keys[index], weight: FontWeight.w500),
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
    );
  }
}





class OrangeMoneyDetail extends StatefulWidget {
  const OrangeMoneyDetail(
      {super.key,required this.moneyList,required this.bgColor,required this.titleColor,required this.title}
      );
  final List<dynamic> moneyList;
  final Color titleColor;
  final String title;
  final Color bgColor;

  @override
  State<OrangeMoneyDetail> createState() => _OrangeMoneyDetailState();
}

class _OrangeMoneyDetailState extends State<OrangeMoneyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: widget.title,
        bgColor: widget.bgColor,
        centerTitle: true,
        titleColor: widget.titleColor,
        haveLeading: false,
      ),
      body: PopScope(
        canPop: false, // Prevent default back behavior
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.close(2); // Close two screens when back button is pressed
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: ListView.builder(
            itemCount: widget.moneyList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {

                      Get.to(()=> OrangeMoneyPurchase(moneyList:
                      ['Pass Mix 1000F (70min+600Mo)',
                        'Pass Mix 500F (50min+250Mo)'
                      ],
                          bgColor: widget.bgColor,
                          titleColor: widget.titleColor,
                          title: widget.title));

                      //showPurchaseBottomSheet(context, )


                    },
                    title: MyText(text: widget.moneyList[index], weight: FontWeight.w500),
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

class OrangeMoneyPurchase extends StatefulWidget {
  const OrangeMoneyPurchase(
      {super.key,required this.moneyList,required this.bgColor,required this.titleColor,required this.title}

      );
  final List<dynamic> moneyList;
  final Color titleColor;
  final String title;
  final Color bgColor;

  @override
  State<OrangeMoneyPurchase> createState() => _OrangeMoneyPurchaseState();
}

class _OrangeMoneyPurchaseState extends State<OrangeMoneyPurchase> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: widget.title,
        bgColor: widget.bgColor,
        centerTitle: true,
        titleColor: widget.titleColor,
        haveLeading: false,
      ),
      body: PopScope(
        canPop: false, // Prevent default back behavior
        onPopInvoked: (didPop) {
          if (!didPop) {
            Get.close(3); // Close two screens when back button is pressed
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: ListView.builder(
            itemCount: widget.moneyList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {

                      showPurchaseBottomSheet(context,widget.moneyList[index],_formKey);


                    },
                    title: MyText(text: widget.moneyList[index], weight: FontWeight.w500),
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
