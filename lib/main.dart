import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/splash_onboarding.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/setup_personal_info.dart';
import 'screens/setup_shipping_address.dart';
import 'screens/setup_payment.dart';
import 'screens/home.dart';
import 'screens/cart.dart';
import 'screens/checkout.dart';
import 'screens/shop.dart';
import 'screens/profile.dart';
import 'screens/orders.dart';
import 'screens/order_confirmation.dart';

void main() {
  runApp(const StitchApp());
}

class StitchApp extends StatelessWidget {
  const StitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAVE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashOnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/setup_personal': (context) => const SetupPersonalInfoScreen(),
        '/setup_shipping': (context) => const SetupShippingAddressScreen(),
        '/setup_payment': (context) => const SetupPaymentScreen(),
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/shop': (context) => const ShopScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/order_confirmation': (context) => const OrderConfirmationScreen(),
      },
    );
  }
}
