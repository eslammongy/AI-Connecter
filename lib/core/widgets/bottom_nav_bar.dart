import 'package:ai_connect/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_nav_bar_item.dart';

typedef GetCurrentIndex = void Function(int index);

class FloatingBottomNavBar extends StatelessWidget {
  final Function()? onAddBtnTap;
  final GetCurrentIndex getCurrentIndex;
  final int currentIndex;
  const FloatingBottomNavBar({
    super.key,
    this.onAddBtnTap,
    required this.getCurrentIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: appColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withValues(alpha: 0.3), // Shadow color with transparency
              spreadRadius: 6, // How far the shadow extends
              blurRadius: 4, // Blur effect
              offset: const Offset(1, 1), // Shadow position (x, y)
            )
          ],
        ),
        child: SizedBox(
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavItem(
                title: "Home",
                icon: FontAwesomeIcons.house,
                isActive: currentIndex == 0 ? true : false,
                onTap: () {
                  getCurrentIndex(0);
                },
              ),
              BottomNavItem(
                title: "Archives",
                icon: FontAwesomeIcons.boxArchive,
                isActive: currentIndex == 1 ? true : false,
                onTap: () {
                  getCurrentIndex(1);
                },
              ),
              BottomNavItem(
                title: "Settings",
                icon: FontAwesomeIcons.userGear,
                isActive: currentIndex == 2 ? true : false,
                onTap: () {
                  getCurrentIndex(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
