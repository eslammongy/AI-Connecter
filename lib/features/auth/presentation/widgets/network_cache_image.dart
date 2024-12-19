import 'package:flutter/material.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ai_connect/core/constant/app_assets_manager.dart';

class CacheNetworkProfileImg extends StatelessWidget {
  const CacheNetworkProfileImg({
    super.key,
    required this.imgUrl,
    this.radius = 80,
  });

  final String imgUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fadeInCurve: Curves.bounceInOut,
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) =>
          _buildImageRoundedCard(theme, imageProvider: imageProvider),
      placeholder: (context, url) => _buildImageRoundedCard(
        theme,
        isLoading: true,
      ),
      errorWidget: (context, url, error) => _buildImageRoundedCard(
        theme,
      ),
    );
  }

  _buildImageRoundedCard(ThemeData theme,
      {bool isLoading = false, ImageProvider? imageProvider}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: theme.appColors.tertiary, width: 2),
      ),
      margin: EdgeInsets.zero,
      color: theme.appColors.surface,
      elevation: 1,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        backgroundImage: imageProvider,
        child: _setRoundedImgCardChild(
          theme,
          isLoading: isLoading,
          imageProvider: imageProvider,
        ),
      ),
    );
  }

  Widget _setRoundedImgCardChild(ThemeData theme,
      {bool isLoading = false, ImageProvider? imageProvider}) {
    if (isLoading) {
      return CircularProgressIndicator(
        color: theme.appColors.primary,
      );
    }
    return imageProvider != null
        ? Image(
            image: imageProvider,
            fit: BoxFit.contain,
            width: 110,
          )
        : Image.asset(
            AppAssetsManager.logo,
            width: 32,
            fit: BoxFit.contain,
          );
  }
}
