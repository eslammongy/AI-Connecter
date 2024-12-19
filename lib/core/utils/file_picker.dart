import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

abstract class FilePickerUtil {
  static final ImagePicker _imagePicker = ImagePicker();

  /// Pick an image from the gallery
  static Future<Uint8List?> pickImageFromGallery() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path).readAsBytes();
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
    return null;
  }

  /// Pick an image from the camera
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
    }
    return null;
  }

  /// Pick any file from device storage
  // Future<File?> pickFile() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
  //     if (result != null && result.files.single.path != null) {
  //       return File(result.files.single.path!);
  //     }
  //   } catch (e) {
  //     debugPrint('Error picking file: $e');
  //   }
  //   return null;
  // }
}
