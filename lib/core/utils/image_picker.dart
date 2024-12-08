import 'package:ai_connect/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtility {
  /// pick an image from camera
  Future<XFile?> pickImageFromCamera(BuildContext context) async {
    try {
      final pickedImg = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (pickedImg == null) return null;
      return pickedImg;
    } on Exception catch (e) {
      if (!context.mounted) return null;
      return _handleExpState(context, e.toString());
    }
  }

  /// pick an image fromGallery
  Future<XFile?> pickGalleryImage(BuildContext context) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (pickedFile == null) return null;
      return pickedFile;
    } on Exception catch (e) {
      if (!context.mounted) return null;
      return _handleExpState(context, e.toString());
    }
  }

  Null _handleExpState(BuildContext context, String expMsg) {
    displaySnackBar(context, expMsg);
    GoRouter.of(context).pop();
    return null;
  }
}
