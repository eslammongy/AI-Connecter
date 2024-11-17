import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/widgets/image_picker/pick_image_option.dart';
import 'package:flutter/material.dart';

class ImagePickerBody extends StatelessWidget {
  const ImagePickerBody({
    super.key,
    required this.onGalleryTap,
    required this.onCameraTap,
  });
  final Function() onGalleryTap;
  final Function() onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        bottom: 15.0,
        top: 40,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            PickImageOption(
              title: "Gallery",
              icon: Icons.image_rounded,
              onTap: onGalleryTap,
            ),
            PickImageOption(
              title: "Camera",
              icon: Icons.camera_rounded,
              onTap: onCameraTap,
            ),
          ],
        ),
      ),
    );
  }
}

void displayImagePickerOption(
  BuildContext context, {
  required Function() onGalleryTap,
  required Function() onCameraTap,
}) {
  final theme = context.theme;
  showModalBottomSheet(
      backgroundColor: theme.appColors.surface,
      context: context,
      builder: (builder) {
        return ImagePickerBody(
          onCameraTap: onCameraTap,
          onGalleryTap: onGalleryTap,
        );
      });
}
