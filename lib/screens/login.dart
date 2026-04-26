import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/global_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(showProfile: false),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Ethereal Background
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.etherealBackground,
            ),
          ),
          
          // Ambient Blobs
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
          Positioned(
            bottom: -100,
            left: MediaQuery.of(context).size.width / 4,
            child: _buildBlob(288, AppColors.secondaryContainer.withOpacity(0.2)),
          ),

          // Form
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
              child: GlassCard(
                borderRadius: 40,
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign in to continue your journey.',
                      style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
                    ),
                    const SizedBox(height: 32),
                    _buildInputGroup('EMAIL ADDRESS', 'identity@lave.com'),
                    const SizedBox(height: 24),
                    _buildInputGroup('PASSWORD', '••••••••', isPassword: true, showVisibility: true),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.black45, fontSize: 12)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildLoginButton(context),
                    const SizedBox(height: 32),

                    _buildFooter(context),
                  ],
                ),
              ),
            ),
          ),

          // Identity Footer
          const Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Text(
              'MINIMALISM. LUXURY. FUTURE.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 5,
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
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

  Widget _buildInputGroup(String label, String hint, {bool isPassword = false, bool showVisibility = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              if (showVisibility)
                const Icon(Icons.visibility_outlined, size: 16, color: AppColors.onSurfaceVariant),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: AppColors.iridescent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text(
          'SIGN IN',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('NEW TO LAVE? ', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/signup'),
          child: const Text('CREATE ACCOUNT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
