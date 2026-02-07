import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);
    final topPadding = ResponsiveHelper.getSpacing(
      context,
      mobile: 24,
      tablet: 28,
      desktop: 32,
    );
    final bottomPadding = ResponsiveHelper.getSpacing(
      context,
      mobile: 12,
      tablet: 16,
      desktop: 20,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        bottomPadding,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: ResponsiveHelper.getFontSize(
            context,
            mobile: 20,
            tablet: 24,
            desktop: 28,
          ),
        ),
      ),
    );
  }
}
