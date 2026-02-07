import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.textColor});

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);
    final iconSize = ResponsiveHelper.getIconSize(
      context,
      mobile: 32,
      tablet: 36,
      desktop: 40,
    );
    final badgeSize = screenWidth > 600 ? 20.0 : 18.0;
    final badgeFontSize = screenWidth > 600 ? 11.0 : 10.0;

    return Container(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        screenWidth > 600 ? 16 : 12,
        horizontalPadding,
        8,
      ),
      child: Row(
        children: [
          Icon(Icons.eco, size: iconSize, color: textColor),
          SizedBox(
            width: ResponsiveHelper.getSpacing(context, mobile: 12, tablet: 16),
          ),
          Expanded(
            child: Text(
              'FreshCart',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.getFontSize(
                  context,
                  mobile: 20,
                  tablet: 24,
                  desktop: 28,
                ),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: textColor,
                  size: iconSize - 2,
                ),
              ),
              Positioned(
                right: screenWidth > 600 ? 8 : 6,
                top: screenWidth > 600 ? 8 : 6,
                child: Container(
                  width: badgeSize,
                  height: badgeSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF29F05),
                    borderRadius: BorderRadius.circular(badgeSize / 2),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: badgeFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
