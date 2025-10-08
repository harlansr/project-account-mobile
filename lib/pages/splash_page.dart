import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Simulasi loading 2 detik
    Timer(const Duration(seconds: 0), () {
      if (mounted) {
        // Navigator.pushReplacementNamed(context, '/login');
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xFF4749A0),
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            ),
        ),
      ),
    );
  }
}
