import 'dart:io';

import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:ai_connect/core/utils/image_picker.dart';
import 'package:ai_connect/core/widgets/image_picker/image_picker_button.dart';
import 'package:ai_connect/core/widgets/image_picker/image_picker_sheet.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_bloc.dart';
import 'package:ai_connect/features/user/presentation/bloc/user_profile_events.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'network_cache_image.dart';

class ProfileImageSection extends StatefulWidget {
  const ProfileImageSection({super.key, required this.profileImgUrl});
  final String? profileImgUrl;

  @override
  State<ProfileImageSection> createState() => _ProfileImageSectionState();
}

class _ProfileImageSectionState extends State<ProfileImageSection> {
  File? selectedImg;
  final imagePicker = ImagePickerUtility();

  @override
  Widget build(BuildContext context) {
    final userBloc = UserProfileBloc.get(context);
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
                  imgUrl:
                      "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
          Positioned(
              bottom: 5,
              right: 0,
              child: ImagePickerButton(
                onPressed: () {
                  displayImagePickerOption(
                    context,
                    onGalleryTap: () async {
                      //* close the bottom sheet
                      GoRouter.of(context).pop();
                      final imgFile =
                          await imagePicker.pickGalleryImage(context);
                      if (imgFile != null) {
                        updateProfileImage(userBloc, imgFile);
                      }
                    },
                    onCameraTap: () async {
                      //* close the bottom sheet
                      GoRouter.of(context).pop();
                      final imgFile =
                          await imagePicker.pickImageFromCamera(context);
                      if (imgFile != null) {
                        updateProfileImage(userBloc, imgFile);
                      }
                    },
                  );
                },
              )),
        ],
      ),
    );
  }

  final roundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(80),
    side: const BorderSide(width: 2, color: Colors.white),
  );

  updateProfileImage(UserProfileBloc userBloc, XFile imgFile) {
    userBloc.add(
      UserProfileSetImgEvent(imgFile: imgFile),
    );
    setState(() => selectedImg = File(imgFile.path));
  }
}
