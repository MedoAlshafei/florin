import 'package:flutter/material.dart';

class ResponsiveHelper {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Check if mobile
  static bool isMobile(BuildContext context) {
    return screenWidth(context) < mobileBreakpoint;
  }

  // Check if tablet
  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  // Check if desktop
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= desktopBreakpoint;
  }

  // Get responsive padding
  static EdgeInsets getPadding(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
    } else if (width >= tabletBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 20);
    } else if (width >= mobileBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  }

  // Get horizontal padding only
  static double getHorizontalPadding(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 48;
    if (width >= tabletBreakpoint) return 32;
    if (width >= mobileBreakpoint) return 24;
    return 16;
  }

  // Get responsive font size
  static double getFontSize(BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint && desktop != null) return desktop;
    if (width >= tabletBreakpoint && tablet != null) return tablet;
    return mobile ?? 14;
  }

  // Get responsive icon size
  static double getIconSize(BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint && desktop != null) return desktop;
    if (width >= tabletBreakpoint && tablet != null) return tablet;
    return mobile ?? 24;
  }

  // Get grid cross axis count
  static int getGridCrossAxisCount(BuildContext context) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint) return 4;
    if (width >= tabletBreakpoint) return 3;
    return 2;
  }

  // Get responsive spacing
  static double getSpacing(BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = screenWidth(context);
    if (width >= desktopBreakpoint && desktop != null) return desktop;
    if (width >= tabletBreakpoint && tablet != null) return tablet;
    return mobile ?? 8;
  }
}

