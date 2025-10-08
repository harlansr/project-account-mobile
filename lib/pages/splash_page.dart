import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Timer(const Duration(seconds: 0), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');
      if (mounted) {
        // Navigator.pushReplacementNamed(context, '/login');

        if(accessToken != null && accessToken != ''){
          Navigator.pushReplacementNamed(context, '/home');
        }else{
          Navigator.pushReplacementNamed(context, '/login');
        }
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
