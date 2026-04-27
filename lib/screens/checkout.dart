import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        showBack: true,
        onBack: () => Navigator.pushReplacementNamed(context, '/cart'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.etherealBackground,
            ),
          ),
          Positioned(
            top: -100,
            left: -100,
            child: _buildBlob(384, AppColors.secondaryContainer.withOpacity(0.2)),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            right: -100,
            child: _buildBlob(320, AppColors.surfaceVariant.withOpacity(0.3)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
              child: Column(
                children: [
                  GlassCard(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Text(
                          'Secure Checkout',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'STEP 3 OF 3: PAYMENT & CONFIRMATION',
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildShippingAddressBento(context),
                  const SizedBox(height: 16),

                  _buildPaymentMethodBento(context),
                  const SizedBox(height: 16),

                  _buildOrderSummaryBento(context),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: _buildActionFooter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBlob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildShippingAddressBento(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.local_shipping_outlined, size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      'SHIPPING ADDRESS',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Amara Perera,\n45/2 Galle Road,\nColombo 03, Sri Lanka',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.edit_outlined, color: AppColors.onSurfaceVariant, size: 20),
              const SizedBox(height: 24),
              Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant.withOpacity(0.4), size: 24),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPaymentMethodBento(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.payments_outlined, size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      'PAYMENT METHOD',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      '•••• 4421, Exp 05/26',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.cyan, size: 24),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant.withOpacity(0.4), size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummaryBento(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildSummaryRow('Subtotal', 'Rs. 62,400'),
                const SizedBox(height: 12),
                _buildSummaryRow('Shipping', 'Rs. 1,500'),
                const SizedBox(height: 12),
                _buildSummaryRow('VAT/Tax', 'Rs. 7,488'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                ),
                const Text(
                  'Rs. 71,388',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
      ],
    );
  }

  Widget _buildActionFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: AppColors.iridescent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/order_confirmation'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text(
          'PLACE ORDER SECURELY',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
