import 'package:flutter/material.dart';
import 'package:kanban_time_board/src/core/extensions/context_extension.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget desktop;

  const ResponsiveScreen({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.desktop,
  });

  static double mobileMaxWidth = 480;
  static double tabletMaxWidth = 768;
  static double laptopMaxWidth = 1023;

  static bool isMobile(BuildContext context) =>
      context.screenSize.width < mobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      context.screenSize.width < tabletMaxWidth &&
      context.screenSize.width >= mobileMaxWidth;

  static bool isLaptop(BuildContext context) =>
      context.screenSize.width < laptopMaxWidth &&
      context.screenSize.width >= tabletMaxWidth;

  static bool isDesktop(BuildContext context) =>
      context.screenSize.width >= laptopMaxWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = context.screenSize;
    if (size.width >= laptopMaxWidth) {
      return desktop;
    } else if (size.width >= tabletMaxWidth && size.width < laptopMaxWidth) {
      return laptop;
    } else if (size.width >= mobileMaxWidth && size.width < tabletMaxWidth) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
