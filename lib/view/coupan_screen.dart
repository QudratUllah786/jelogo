import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:jelogo/widgets/my_text.dart';



class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> coupons = [
      {'title': 'Summer Sale', 'expiry': 'Oct 30, 2025', 'discount': '20%', 'code': 'SUMMER20'},
      {'title': 'Winter Offer', 'expiry': 'Dec 25, 2025', 'discount': '30%', 'code': 'WINTER30'},
    ];

    return Scaffold(
      appBar: simpleAppBar(title: 'Coupons'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coupons.length,
        itemBuilder: (context, index) {
          var coupon = coupons[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text:coupon['title']!,
                     size: 18.w,
                    weight: FontWeight.w600,
                  ),
                  MyText(text:'Expires: ${coupon['expiry']}'),
                  MyText(text:'Discount: ${coupon['discount']}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(text:'Code: ${coupon['code']}', weight: FontWeight.bold,),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: coupon['code']!));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Coupon code copied!')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

