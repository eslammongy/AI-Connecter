import 'dart:io';

import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/helper.dart';
import 'package:ai_connect/core/widgets/image_picker/image_picker_button.dart';
import 'package:ai_connect/core/widgets/image_picker/image_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'network_cache_image.dart';

class ProfileImageSection extends StatefulWidget {
  const ProfileImageSection({super.key, required this.profileImgUrl});
  final String profileImgUrl;

  @override
  State<ProfileImageSection> createState() => _ProfileImageSectionState();
}

class _ProfileImageSectionState extends State<ProfileImageSection> {
  File? selectedImg;

  @override
  Widget build(BuildContext context) {
    final roundedShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
        side: const BorderSide(width: 2, color: Colors.white));
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          selectedImg != null
              ? Card(
                  color: context.theme.appColors.surface,
                  margin: EdgeInsets.zero,
                  shape: roundedShape,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(selectedImg!),
                  ),
                )
              : CacheNetworkProfileImg(
                  imgUrl: widget.profileImgUrl,
                ),
          Positioned(
              bottom: 5,
              right: 0,
              child: ImagePickerButton(
                onPressed: () {
                  displayImagePickerOption(
                    context,
                    onGalleryTap: () {},
                    onCameraTap: () async {
                      //* close the bottom sheet
                      GoRouter.of(context).pop();
                      final imgFile = await pickImageFromCamera(context);
                      if (imgFile != null) {
                        selectedImg = File(imgFile.path);
                      }
                    },
                  );
                },
              )),
        ],
      ),
    );
  }

  /// pick an image from camera
  Future<XFile?> pickImageFromCamera(BuildContext context) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImg = await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedImg == null) return null;
      return pickedImg;
    } on Exception catch (e) {
      if (!context.mounted) return null;
      displaySnackBar(context, e.toString());
      GoRouter.of(context).pop();
      return null;
    }
  }
}
