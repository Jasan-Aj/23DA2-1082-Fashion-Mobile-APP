import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';
import '../data/mock_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(showBack: true),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDF8F8),
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
                const SizedBox(height: kToolbarHeight + 40),
                
                _buildProductShowcase(context),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildInfoCard(context),
                      const SizedBox(height: 16),
                      _buildConfigCard(context),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                
                _buildFeaturedLooks(context),
                const SizedBox(height: 120),
              ],
            ),
          ),
          
          _buildActionFooter(context),
        ],
      ),
    );
  }

  Widget _buildProductShowcase(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -10,
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(100, 20)),
                border: Border.all(color: Colors.black.withOpacity(0.05), width: 2),
              ),
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
          
          Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Hero(
              tag: 'product-${product.id}',
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SWEATSHIRT by Lave',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Rs. ${product.price.toInt()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(width: 12),
              Text(
                'Rs. ${product.price.toInt() + 5000}',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfigCard(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SELECT SIZE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 16),
          Row(
            children: ['S', 'M', 'L', 'XL'].map((size) {
              final isM = size == 'M';
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isM ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: isM ? Colors.black : Colors.black12),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isM ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          const Text('COLOR SWATCH', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildColorCircle(Colors.black, isActive: true),
              _buildColorCircle(Colors.grey[200]!),
              _buildColorCircle(const Color(0xFF064E3B)),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            product.description,
            style: TextStyle(color: Colors.black.withOpacity(0.6), height: 1.6, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: isActive ? Colors.black : Colors.transparent, width: 2),
      ),
      child: isActive ? const Center(child: Icon(Icons.check, color: Colors.white, size: 12)) : null,
    );
  }

  Widget _buildFeaturedLooks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('FEATURED LOOKS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('asset/images/casual.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionFooter(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.white, Colors.white.withOpacity(0)],
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            gradient: AppColors.iridescent,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00F0FF).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product.name} added to cart!'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.black.withOpacity(0.8),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ADD TO CART', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                SizedBox(width: 8),
                Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
