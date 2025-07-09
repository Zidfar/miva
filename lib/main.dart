import 'package:flutter/material.dart';
import 'features/auth/screens/welcome_screen.dart'; // Pastikan path ke WelcomeScreen benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
