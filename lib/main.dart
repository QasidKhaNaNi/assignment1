import 'package:flutter/material.dart';
import 'models/product.dart';
import 'providers/cart_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_listing_screen.dart';

void main() {
  runApp(const Assignment1App());
}

class Assignment1App extends StatefulWidget {
  const Assignment1App({super.key});

  @override
  State<Assignment1App> createState() => _Assignment1AppState();
}

class _Assignment1AppState extends State<Assignment1App> {
  late final CartProvider _cartProvider;

  @override
  void initState() {
    super.initState();
    _cartProvider = CartProvider();
  }

  @override
  void dispose() {
    _cartProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartScope(
      notifier: _cartProvider,
      child: MaterialApp(
        title: 'Assignment 1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
          '/products': (context) => const ProductListingScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/product-details') {
            final args = settings.arguments;
            final product = args is Product ? args : Product.sampleProducts.first;
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                backgroundColor: const Color(0xFF0F0C29),
                body: Center(
                  child: Text(
                    'Details for ${product.name}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              settings: settings,
            );
          }
          if (settings.name == '/cart') {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                backgroundColor: Color(0xFF0F0C29),
                body: Center(
                  child: Text(
                    'Shopping Cart Screen Placeholder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              settings: settings,
            );
          }
          if (settings.name == '/checkout') {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                backgroundColor: Color(0xFF0F0C29),
                body: Center(
                  child: Text(
                    'Checkout Screen Placeholder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );
  }
}
