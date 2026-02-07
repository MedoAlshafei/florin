import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.colorScheme,
    required this.currentIndex,
    required this.onTap,
  });

  final ColorScheme colorScheme;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final navHeight = screenWidth > 600 ? 80.0 : 72.0;
    final horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return SafeArea(
      child: Container(
        height: navHeight,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: colorScheme.surface.withOpacity(0.95),
          border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.08)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              label: 'Home',
              icon: Icons.home,
              active: currentIndex == 0,
              activeColor: colorScheme.primary,
              onTap: () => onTap(0),
            ),
            NavItem(
              label: 'Browse',
              icon: Icons.category,
              active: currentIndex == 1,
              activeColor: colorScheme.primary,
              onTap: () => onTap(1),
            ),
            NavItem(
              label: 'Cart',
              icon: Icons.shopping_cart,
              active: currentIndex == 2,
              activeColor: colorScheme.primary,
              onTap: () => onTap(2),
            ),
            NavItem(
              label: 'Account',
              icon: Icons.person,
              active: currentIndex == 3,
              activeColor: colorScheme.primary,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.label,
    required this.icon,
    this.active = false,
    this.activeColor,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool active;
  final Color? activeColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = active
        ? activeColor ?? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    final iconSize = ResponsiveHelper.getIconSize(
      context,
      mobile: 24,
      tablet: 26,
      desktop: 28,
    );
    final fontSize = ResponsiveHelper.getFontSize(
      context,
      mobile: 12,
      tablet: 13,
      desktop: 14,
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: iconSize),
          SizedBox(
            height: ResponsiveHelper.getSpacing(context, mobile: 4, tablet: 6),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
