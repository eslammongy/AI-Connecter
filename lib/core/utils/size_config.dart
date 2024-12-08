import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktopBreakpoint = 1200;
  static const double tabletBreakpoint = 800;
  static const double mobileBreakpoint = 350;

  SizeConfig._internal();
  static final SizeConfig _instance = SizeConfig._internal();
  factory SizeConfig() => _instance;

  double _width = 0;
  double get width => _width;
  void init(BuildContext context) {
    _width = MediaQuery.sizeOf(context).width;
  }

  bool get isMobile => _width < tabletBreakpoint;
  bool get isTablet => _width >= tabletBreakpoint && _width < desktopBreakpoint;
  bool get isDesktop => _width >= desktopBreakpoint;

  /// Scale text size based on device type
  double scaleText(double baseSize) {
    if (isDesktop) return baseSize * 1.2;
    if (isTablet) return baseSize * 1.0;
    return baseSize * 0.8;
  }
}
