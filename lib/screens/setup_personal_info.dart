import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';

class SetupPersonalInfoScreen extends StatelessWidget {
  const SetupPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: 'IDENTITY', showBack: true),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDF8F8),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'asset/images/profile.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
            child: Column(
              children: [
                const SizedBox(height: 48),
                Text(
                  'Identity',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontFamily: 'Noto Serif',
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Update your personal details to maintain your curated experience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const SizedBox(height: 48),
                
                GlassCard(
                  padding: const EdgeInsets.all(32),
                  borderRadius: 40,
                  child: Column(
                    children: [
                      _buildInputField('FULL NAME', 'Jasan AJ', Icons.person_outline),
                      const SizedBox(height: 24),
                      _buildInputField('PHONE NUMBER', '+94 717236454', Icons.call_outlined),
                      const SizedBox(height: 24),
                      _buildInputField('DATE OF BIRTH', '2003-11-14', Icons.calendar_today_outlined),
                      const SizedBox(height: 40),
                      
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('SAVE INFO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String value, IconData icon) {
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
          controller: TextEditingController(text: value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            suffixIcon: Icon(icon, color: Colors.black26, size: 20),
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

  Widget _buildTextButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.black54),
      label: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
    );
  }
}
