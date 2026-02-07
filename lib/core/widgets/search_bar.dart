import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final screenWidth = MediaQuery.of(context).size.width;
    final searchHeight = screenWidth > 600 ? 56.0 : 48.0;
    final horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);
    final iconSize = ResponsiveHelper.getIconSize(
      context,
      mobile: 24,
      tablet: 26,
      desktop: 28,
    );

    return Padding(
      padding: EdgeInsets.all(horizontalPadding),
      child: Container(
        height: searchHeight,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: horizontalPadding),
            Icon(
              Icons.search,
              color: textColor.withOpacity(0.6),
              size: iconSize,
            ),
            SizedBox(
              width: ResponsiveHelper.getSpacing(
                context,
                mobile: 8,
                tablet: 12,
              ),
            ),
            Expanded(
              child: TextField(
                onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
                style: TextStyle(
                  color: textColor,
                  fontSize: ResponsiveHelper.getFontSize(
                    context,
                    mobile: 14,
                    tablet: 16,
                    desktop: 18,
                  ),
                ),
                decoration: InputDecoration(
                  hintText: 'Search for fruits, veggies...',
                  hintStyle: TextStyle(
                    color: textColor.withOpacity(0.6),
                    fontSize: ResponsiveHelper.getFontSize(
                      context,
                      mobile: 14,
                      tablet: 16,
                      desktop: 18,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
