import 'package:flutter/material.dart';
import '../core/theme.dart';

class BottomNavDock extends StatelessWidget {
  final int activeIndex;

  const BottomNavDock({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      left: 24,
      right: 24,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dst),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, 0, Icons.home_outlined, '/home'),
                _buildNavItem(context, 1, Icons.explore_outlined, '/shop'),
                _buildNavItem(context, 2, Icons.shopping_bag_outlined, '/cart'),
                _buildNavItem(context, 3, Icons.receipt_long_outlined, '/orders'),
                _buildNavItem(context, 4, Icons.person_outline, '/profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String route) {
    final bool isActive = activeIndex == index;
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          gradient: isActive ? AppColors.iridescent : null,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.black45,
          size: 28,
        ),
      ),
    );
  }

}
