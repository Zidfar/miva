import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8D5BA), // warna bg sesuai kode hex
      body: Center(
        child: Image.asset(
          'assets/logo/logo.png',
          width: 160, // sesuaikan ukuran sesuai kebutuhan/desain
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
