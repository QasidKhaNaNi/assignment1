import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const Assignment1App());
}

class Assignment1App extends StatelessWidget {
  const Assignment1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/signup': (context) => const _SignupPlaceholderScreen(),
        '/home': (context) => const _HomePlaceholderScreen(),
      },
    );
  }
}

// Temporary placeholder until feature/signup-screen branch is created
class _SignupPlaceholderScreen extends StatelessWidget {
  const _SignupPlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0C29),
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Text(
          'Sign Up Screen Placeholder\n(To be implemented in feature/signup-screen)',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

// Temporary placeholder until feature/home-page branch is created
class _HomePlaceholderScreen extends StatelessWidget {
  const _HomePlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0C29),
      body: Center(
        child: Text(
          'Home Screen Placeholder\n(To be implemented in feature/home-page)',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
