import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/global_app_bar.dart';

class SetupShippingAddressScreen extends StatelessWidget {
  const SetupShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'LOGISTICS', showBack: true),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDF8F8),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: _buildAmbientCircle(300, const Color(0xFFCFFAFE)),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _buildAmbientCircle(250, const Color(0xFFE0E7FF)),
          ),
          
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text('ACCOUNT SETUP', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.black45)),
                const SizedBox(height: 8),
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontFamily: 'Noto Serif',
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Provide your destination for haute couture delivery. We ensure a seamless logistics experience for every piece.',
                  style: TextStyle(color: Colors.black54, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 48),
                
                Row(
                  children: [
                    Expanded(child: _buildInputField('FULL NAME', 'Jasan AJ')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildInputField('CONTACT NUMBER', '+94 717236454')),
                  ],
                ),
                const SizedBox(height: 16),
                _buildInputField('STREET ADDRESS', 'Colombo 14'),
                const SizedBox(height: 16),
                _buildInputField('APARTMENT, SUITE, ETC. (OPTIONAL)', 'Studio 4B'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildInputField('CITY', 'Colombo')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildInputField('STATE / REGION', 'Southern')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildInputField('POSTAL CODE', '14000')),
                  ],
                ),
                const SizedBox(height: 16),
                _buildInputField('COUNTRY', 'Sri Lanka', icon: Icons.expand_more),
                
                const SizedBox(height: 32),
                
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        gradient: AppColors.iridescent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.check, color: Colors.white, size: 14),
                    ),
                    const SizedBox(width: 12),
                    const Text('Set as primary shipping address', style: TextStyle(color: Colors.black54, fontSize: 14)),
                  ],
                ),
                
                const SizedBox(height: 48),
                
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
                    child: const Text('SAVE ADDRESS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ),
                ),
                
                const SizedBox(height: 48),
                
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmbientCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {IconData? icon}) {
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
