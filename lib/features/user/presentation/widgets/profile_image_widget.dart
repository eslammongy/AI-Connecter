import 'dart:io';

import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
            child: IconButton(
              style: TextButton.styleFrom(
                  backgroundColor: context.theme.appColors.surface,
                  elevation: 0),
              icon: Icon(
                Icons.add_a_photo_rounded,
                color: context.theme.appColors.onSurface,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
