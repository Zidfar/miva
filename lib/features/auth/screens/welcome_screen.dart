import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart'; // Pastikan path sesuai foldermu

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8D5BA),
      body: Center(
        child: Image.asset(
          'assets/logo/logo.png',
          width: 160,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
