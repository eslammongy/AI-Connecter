import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FilePickerUtil {
  // Singleton pattern for reuse
  FilePickerUtil._privateConstructor();
  static final FilePickerUtil instance = FilePickerUtil._privateConstructor();

  final ImagePicker _imagePicker = ImagePicker();

  /// Pick an image from the gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
    return null; // Return null if no file selected or an error occurs
  }

  /// Pick an image from the camera
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
    return null; // Return null if no file selected or an error occurs
  }

  /// Pick any file from device storage
  Future<File?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      print('Error picking file: $e');
    }
    return null; // Return null if no file selected or an error occurs
  }
}
