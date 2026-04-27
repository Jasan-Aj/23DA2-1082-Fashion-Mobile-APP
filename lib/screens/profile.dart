import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/mock_data.dart';
import '../widgets/glass_card.dart';
import '../widgets/bottom_nav_dock.dart';
import '../widgets/global_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'PROFILE'),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE6E1F9), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 80),
                Hero(
                  tag: 'profile_image',
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(mockUser.profileImageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(mockUser.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),
                Text(mockUser.email, style: const TextStyle(color: Colors.black45, fontSize: 14)),
                
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GlassCard(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        _buildMenuItem(context, Icons.person_outline, 'Personal Info', () => Navigator.pushNamed(context, '/setup_personal')),
                        _buildMenuItem(context, Icons.shopping_bag_outlined, 'My Orders', () => Navigator.pushNamed(context, '/orders')),
                        _buildMenuItem(context, Icons.location_on_outlined, 'Shipping Address', () => Navigator.pushNamed(context, '/setup_shipping')),
                        _buildMenuItem(context, Icons.payment_outlined, 'Payment Methods', () => Navigator.pushNamed(context, '/setup_payment')),
                        _buildMenuItem(context, Icons.settings_outlined, 'Settings', () {}),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Divider(color: Colors.black12),
                        ),
                        _buildMenuItem(context, Icons.logout, 'Logout', () => Navigator.pushReplacementNamed(context, '/login'), isDestructive: true),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 160),
              ],
            ),
          ),
          
          const BottomNavDock(activeIndex: 4),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.withOpacity(0.05) : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : Colors.black87, size: 20),
      ),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : Colors.black87, fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.black26),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
