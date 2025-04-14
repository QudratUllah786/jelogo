import 'package:flutter/material.dart';

import '../../constants/app_Colors.dart';
import '../my_text.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({
    Key? key,
    required this.onCameraPick,
    required this.onGalleryPick,
  }) : super(key: key);

  final VoidCallback onCameraPick;
  final VoidCallback onGalleryPick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: Card(
        color: kPrimaryColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 10,
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                MyText(
                  paddingLeft: 15,
                  paddingTop: 20,
                  paddingBottom: 10,
                  text: 'Upload from',
                  size: 16,
                  color: kSecondaryColor,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onCameraPick,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                        MyText(
                          paddingTop: 10,
                          text: 'Camera',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: kSecondaryColor,
                    width: 1.0,
                  ),
                  GestureDetector(
                    onTap: onGalleryPick,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        MyText(
                          paddingTop: 10,
                          text: 'Gallery',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

class AttachmentPickerBottomSheet extends StatelessWidget {
  const AttachmentPickerBottomSheet({
    Key? key,
    required this.onAttachmentPic,
    required this.onMediaPic,
  }) : super(key: key);

  final VoidCallback onAttachmentPic;
  final VoidCallback onMediaPic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: Card(
        color: kPrimaryColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 10,
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                MyText(
                  paddingLeft: 15,
                  paddingTop: 20,
                  paddingBottom: 10,
                  text: 'Upload resource',
                  size: 16,
                  color: kSecondaryColor,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onMediaPic,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_camera_back,
                          color: Colors.black,
                        ),
                        MyText(
                          paddingTop: 10,
                          text: 'Video',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: kSecondaryColor,
                    width: 1.0,
                  ),
                  GestureDetector(
                    onTap: onAttachmentPic,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          color: Colors.black,
                        ),
                        MyText(
                          paddingTop: 10,
                          text: 'Attachment',
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
