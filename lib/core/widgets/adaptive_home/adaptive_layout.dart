import 'package:ai_connect/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < SizeConfig.tabletBreakpoint) {
        return mobileLayout(context);
      } else if (constrains.maxWidth < SizeConfig.desktopBreakpoint) {
        return tabletLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}
