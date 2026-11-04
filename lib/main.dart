import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

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
        '/login': (context) => const _LoginPlaceholderScreen(),
      },
    );
  }
}

// Temporary placeholder until feature/login-screen branch adds the full LoginScreen
class _LoginPlaceholderScreen extends StatelessWidget {
  const _LoginPlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0C29),
      body: Center(
        child: Text(
          'Login Screen Placeholder\n(To be implemented in feature/login-screen)',
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
