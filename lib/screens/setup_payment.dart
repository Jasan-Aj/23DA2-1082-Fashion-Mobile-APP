import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';

class SetupPaymentScreen extends StatelessWidget {
  const SetupPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'PAYMENT', showBack: true),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDF8F8),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  'Secure Checkout',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: 'Noto Serif',
                        fontWeight: FontWeight.w300,
                        fontSize: 32,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Finalize your acquisition of luxury.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 48),
                
                // Payment Card
                GlassCard(
                  padding: const EdgeInsets.all(32),
                  borderRadius: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Total Amount Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('TOTAL AMOUNT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.black45)),
                              SizedBox(height: 4),
                              Text('Rs. 2,85,000', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, fontFamily: 'Noto Serif')),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.shield_outlined, color: Colors.black.withOpacity(0.2), size: 20),
                              const SizedBox(width: 4),
                              Text('ENCRYPTED', style: TextStyle(fontSize: 8, color: Colors.black.withOpacity(0.2), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Divider(color: Colors.black12),
                      const SizedBox(height: 32),
                      
                      _buildInputField('CARDHOLDER NAME', 'ELARA VANCE'),
                      const SizedBox(height: 24),
                      _buildInputField('CARD NUMBER', '0000 0000 0000 0000', icon: Icons.credit_card),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: _buildInputField('EXPIRY', 'MM / YY')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildInputField('CVV', '***', isPassword: true)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // Save Card Toggle
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              gradient: AppColors.iridescent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.check, color: Colors.white, size: 12),
                          ),
                          const SizedBox(width: 12),
                          const Text('Save card for future acquisitions', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Action Button
                      Container(
                        width: double.infinity,
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: AppColors.iridescent,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00F0FF).withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                          ),
                          child: const Text('SAVE PAYMENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                        ),
                      ),
                    ],
                  ),
                ),
                

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {IconData? icon, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.black45),
          ),
        ),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            suffixIcon: icon != null ? Icon(icon, color: Colors.black26, size: 20) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
      ],
    );
  }


}
