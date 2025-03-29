// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jelogo/constants/assets_images.dart';
// import 'package:jelogo/widgets/appbar.dart';
// import 'package:jelogo/widgets/general_image_widget.dart';
//
// import '../../../constants/app_Colors.dart';
// import '../../../widgets/my_text.dart';
// import '../../../widgets/my_text_field_widget.dart';
// class ScanSending extends StatelessWidget {
//   const ScanSending({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kSecondaryColor,
//       appBar: simpleAppBar(
//         title: 'Scan Sending',
//         titleColor: kPrimaryColor,
//         leadingColor: kPrimaryColor,
//         bgColor: kSecondaryColor
//       ),
//       body: Column(
//         children: [
//
//          SizedBox(height: 50.h,),
//
//           Expanded(
//             child: Container(
//             //  alignment: Alignment.center,
//               width: double.infinity,
//               //   height: MediaQuery.of(context).size.height * 0.9,
//               decoration: const BoxDecoration(
//                 color: Colors.white, // White background
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               padding: const EdgeInsets.all(20),
//               child: SingleChildScrollView(
//                 child: Column(
//                 //  crossAxisAlignment: CrossAxisAlignment.start,
//                   children:[
//
//                     MyText(text: 'Scan a QR Code',color: kSecondaryColor,
//                     size: 16.sp,
//                       weight: FontWeight.w600,
//                     ),
//
//                     SizedBox(height: 20.h,),
//
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 20.h),
//                       alignment: Alignment.center,
//                       width: 259.w,
//                       height: 304.h,
//                       decoration: BoxDecoration(
//                         color: Color(0xffE9E9E9), // Background color for the icon
//                         borderRadius: BorderRadius.circular(12.sp), // Responsive border radius
//                       ),
//                       child: Column(
//                         children: [
//                           MyText(text: 'Scan your QR',size: 26.sp,weight: FontWeight.w600,),
//
//                           SizedBox(height: 20.h,),
//                           GeneralImageWidget(
//                             imagePath: AssetsImages.qrCode,
//                           ),
//
//
//
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: 20.h,),
//                     MyText(text: 'Please, align QR Code within\n the frame to make scanning\n easily detectable.',
//                     size: 16.sp,
//                       textAlign: TextAlign.center,
//                       weight: FontWeight.w400,
//
//                     )
//
//
//
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:jelogo/widgets/appbar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../widgets/my_text.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'JELOG',
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                print('Barcode found! ${barcode.rawValue}');
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
               text: "Scanner le QR Code",
                color: Colors.white, size: 18, weight: FontWeight.bold,
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => cameraController.start(),
                child: Column(
                  children: [
                    Icon(Icons.refresh, color: Colors.white, size: 30),
                    SizedBox(height: 5),
                    MyText(text:"Toucher pour re-scanner", color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
