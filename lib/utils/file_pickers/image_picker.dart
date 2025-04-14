import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/bottom_sheets/image_picker_bottom_sheet.dart';
import '../snackbars.dart';
class ImagePickerService {
  //private constructor
  ImagePickerService._privateConstructor();

  //singleton instance variable
  static ImagePickerService? _instance;

  //This code ensures that the singleton instance is created only when it's accessed for the first time.
  //Subsequent calls to ImagePickerService.instance will return the same instance that was created before.

  //getter to access the singleton instance
  static ImagePickerService get instance {
    _instance ??= ImagePickerService._privateConstructor();
    return _instance!;
  }

  //select image from camera
  Future<XFile?> pickImageFromCamera() async {
    try {
      XFile? imgXFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (imgXFile == null) {
        return null;
      } else {
        return imgXFile;
      }
    } on PlatformException catch (e) {
      log("This was the platform exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    } catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    }
  }

  //select image from camera
  Future<XFile?> pickVideoFromCamera() async {
    try {
      XFile? imgXFile = await ImagePicker().pickVideo(
        source: ImageSource.camera,
      );
      if (imgXFile == null) {
        return null;
      } else {
        return imgXFile;
      }
    } on PlatformException catch (e) {
      log("This was the platform exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    } catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    }
  }

  //select image from gallery
  Future<XFile?> pickSingleVideoFromGallery() async {
    try {
      XFile? imgXFile =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (imgXFile == null) {
        return null;
      }

      return imgXFile;
    } on PlatformException catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    } catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    }
  }

  //select image from gallery
  Future<XFile?> pickSingleImageFromGallery() async {
    try {
      XFile? imgXFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imgXFile == null) {
        return null;
      }

      return imgXFile;
    } on PlatformException catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    } catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return null;
    }
  }

  //select multiple images from gallery
  Future<List<XFile>> pickMultiImagesFromGallery() async {
    try {
      List<XFile> pickedImages = await ImagePicker().pickMultiImage(limit: 10);
      if (pickedImages.isEmpty) {
        return [];
      }

      return pickedImages;
    } on PlatformException catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return [];
    } catch (e) {
      log("This was the exception while selecting image: $e");

      CustomSnackBars.instance.showFailureSnackbar(
          title: "Error Occurred",
          message: "Something went wrong, please try again");

      return [];
    }
  }

  // Future<String?> pickSinglePDF({List<String>? extensions}) async {
  //   try {
  //     // Pick a single PDF file
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: extensions ?? ['pdf'],
  //     );
  //
  //     if (result == null || result.files.isEmpty) {
  //       return null;
  //     }
  //
  //     return result.files.first.path;
  //   } on PlatformException catch (e) {
  //     log("This was the exception while selecting PDF: $e");
  //
  //     CustomSnackBars.instance.showFailureSnackbar(
  //         title: "Error Occurred",
  //         message: "Something went wrong, please try again");
  //
  //     return null;
  //   } catch (e) {
  //     log("This was the exception while selecting PDF: $e");
  //
  //     CustomSnackBars.instance.showFailureSnackbar(
  //         title: "Error Occurred",
  //         message: "Something went wrong, please try again");
  //
  //     return null;
  //   }
  // }

  //method to open modal bottom sheet for selecting profile pic
  void openProfilePickerBottomSheet(
      {required BuildContext context,
      required VoidCallback onCameraPick,
      required VoidCallback onGalleryPick}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) {
        return ImagePickerBottomSheet(
          onCameraPick: onCameraPick,
          onGalleryPick: onGalleryPick,
        );
      },
    );
  }

  //method to open modal bottom sheet for selecting profile pic
  void openAttachmentPickerBottomSheet(
      {required BuildContext context,
      required VoidCallback onAttachmentPic,
      required VoidCallback onMediaPic}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) {
        return AttachmentPickerBottomSheet(
          onAttachmentPic: onAttachmentPic,
          onMediaPic: onMediaPic,
        );
      },
    );
  }

  // //method to open modal bottom sheet for selecting profile pic
  // void openChatAttachmentPickerBottomSheet(
  //     {required BuildContext context,
  //     required VoidCallback onCameraPick,
  //     required VoidCallback onGalleryPick,
  //     required VoidCallback onPdfPick}) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     builder: (_) {
  //       return ChatAttachmentPickerBottomSheet(
  //         onCameraPick: onCameraPick,
  //         onGalleryPick: onGalleryPick,
  //         onPdfPick: onPdfPick,
  //       );
  //     },
  //   );
  // }

  //method to open modal bottom sheet for selecting profile pic
  // void openAttachmentPickerBottomSheet(
  //     {required BuildContext context,
  //     required VoidCallback onCameraPick,
  //     required VoidCallback onGalleryPick,
  //     required VoidCallback onPdfPick}) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     builder: (_) {
  //       return AttachmentPickerBottomSheet(
  //         onCameraPick: onCameraPick,
  //         onGalleryPick: onGalleryPick,
  //         onPdfPick: onPdfPick,
  //       );
  //     },
  //   );
  // }
}
