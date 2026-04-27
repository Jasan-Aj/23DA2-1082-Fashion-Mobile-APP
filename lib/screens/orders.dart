import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';
import '../widgets/bottom_nav_dock.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        showBack: true,
        onBack: () => Navigator.pushReplacementNamed(context, '/profile'),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDF8F8),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kToolbarHeight + 48),
                Text(
                  'Your Orders',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontFamily: 'Noto Serif',
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Track your current pieces and revisit past acquisitions from our seasonal archives.',
                  style: TextStyle(color: Colors.black54, fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 32),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterButton('All Orders', isActive: true),
                      const SizedBox(width: 16),
                      _buildFilterButton('Active'),
                      const SizedBox(width: 16),
                      _buildFilterButton('Delivered'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                _buildOrderCard(
                  context: context,
                  status: 'IN TRANSIT',
                  statusColor: const Color(0xFF0891B2),
                  date: 'EST. OCT 24, 2026',
                  orderNumber: '#DNE-9921',
                  title: 'Cerulean Silk Blouse & Sculpted Trousers',
                  price: 'Rs. 1,24,000',
                  actionText: 'TRACK DETAILS',
                  actionColor: Colors.black,
                  isPulsing: true,
                  images: [
                    'assets/images/casual.jpg',
                    'assets/images/sweater.jpg',
                  ],
                  extraItemsCount: 1,
                ),
                
                const SizedBox(height: 24),
                
                _buildOrderCard(
                  context: context,
                  status: 'DELIVERED',
                  statusColor: Colors.black54,
                  date: 'SEP 12, 2026',
                  orderNumber: '#DNE-8845',
                  title: 'Desert Oasis Trench Coat (Limited Edition)',
                  price: 'Rs. 89,000',
                  actionText: 'ORDER AGAIN',
                  actionColor: Colors.black54,
                  statusIcon: Icons.check_circle_outline,
                  images: [
                    'assets/images/hoodie.jpg',
                  ],
                ),
                
                const SizedBox(height: 24),
                
                _buildOrderCard(
                  context: context,
                  status: 'DELIVERED',
                  statusColor: Colors.black54,
                  date: 'AUG 05, 2026',
                  orderNumber: '#DNE-7712',
                  title: 'Asymmetric Linen Dress & Accessories',
                  price: 'Rs. 2,10,000',
                  actionText: 'INVOICE',
                  actionColor: Colors.black54,
                  statusIcon: Icons.check_circle_outline,
                  images: [
                    'assets/images/blazer_women.jpg',
                    'assets/images/casual_women.jpg',
                  ],
                ),
                
                const SizedBox(height: 140),
              ],
            ),
          ),
          const BottomNavDock(activeIndex: 3),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, {bool isActive = false}) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: AppColors.iridescent,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00F0FF).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      );
    }
    
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(text, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget _buildOrderCard({
    required BuildContext context,
    required String status,
    required Color statusColor,
    required String date,
    required String orderNumber,
    required String title,
    required String price,
    required String actionText,
    required Color actionColor,
    bool isPulsing = false,
    IconData? statusIcon,
    required List<String> images,
    int? extraItemsCount,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isPulsing)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    gradient: AppColors.iridescent,
                    shape: BoxShape.circle,
                  ),
                )
              else if (statusIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(statusIcon, size: 16, color: statusColor),
                ),
              Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('•', style: TextStyle(color: Colors.black26)),
              ),
              Text(date, style: const TextStyle(color: Colors.black45, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderNumber, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontFamily: 'Noto Serif')),
                    const SizedBox(height: 4),
                    Text(title, style: const TextStyle(color: Colors.black54, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: actionColor, width: 1)),
                    ),
                    child: Text(
                      actionText,
                      style: TextStyle(color: actionColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              for (var img in images)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 64,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                  ),
                ),
              if (extraItemsCount != null)
                Container(
                  width: 64,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      '+$extraItemsCount',
                      style: const TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
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
