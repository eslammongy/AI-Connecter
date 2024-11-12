import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      imageBuilder: (context, imageProvider) => _buildImageRoundedCard(
        imgUrl,
        theme,
      ),
      placeholder: (context, url) => _buildImageRoundedCard(
        imgUrl,
        theme,
      ),
      errorWidget: (context, url, error) => _buildImageRoundedCard(
        imgUrl,
        theme,
      ),
    );
  }

  _buildImageRoundedCard(String imgUrl, ThemeData theme) {
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
        // backgroundImage: AssetImage(AppAssetsManager.aiIMage),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            AppAssetsManager.softwareAgent,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
