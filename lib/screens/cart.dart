import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';
import '../widgets/bottom_nav_dock.dart';
import '../data/mock_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'YOUR CART', showBack: false),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, kToolbarHeight + 40, 24, 120),
            child: Column(
              children: [
              ...mockProducts.take(2).map((product) => _buildCartItem(context, product)),
            const SizedBox(height: 32),
            GlassCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Summary', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 24),
                  _buildSummaryRow('Subtotal', 'Rs. 57,900'),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Shipping', 'Rs. 1,500'),
                  const Divider(height: 48, color: Colors.black12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: Theme.of(context).textTheme.headlineSmall),
                      Text('Rs. 59,400', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 24)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.black12),
                          ),
                          child: const Text('APPLY PROMO', style: TextStyle(color: Colors.black, fontSize: 12)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.black12),
                        ),
                        child: const Text('DETAILS', style: TextStyle(color: Colors.black, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/checkout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                ),
                child: const Text('Proceed to Checkout Rs. 59,400', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 40),
              ],
            ),
          ),
          const BottomNavDock(activeIndex: 2),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Product product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(product.imageUrl, width: 80, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
                      const Icon(Icons.delete_outline, color: Colors.black45, size: 20),
                    ],
                  ),
                  Text('Beige · Size M', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.remove, size: 16), constraints: const BoxConstraints()),
                            const Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 16), constraints: const BoxConstraints()),
                          ],
                        ),
                      ),
                      Text('Rs. ${product.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.black.withOpacity(0.6))),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
