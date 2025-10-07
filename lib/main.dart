import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _deepLink;

  @override
  void initState() {
    super.initState();
    _listenDeepLink();
  }

  // Dengarkan deep link dari native Android (via MethodChannel)
  void _listenDeepLink() {
    const channel = MethodChannel('deep_link_channel');

    channel.setMethodCallHandler((call) async {
      if (call.method == 'onDeepLink') {
        setState(() {
          _deepLink = call.arguments as String?;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Money',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final routeName = _deepLink ?? settings.name ?? '/';
        final uri = Uri.parse(routeName);

        // Normal startup
        if (_deepLink == null && (uri.path == '/' || uri.path.isEmpty)) {
          return MaterialPageRoute(builder: (_) => const SplashPage());
        }

        // Login page
        if (uri.path == '/login' || uri.host == 'login') {
          return MaterialPageRoute(builder: (_) => const LoginPage());
        }

        // Home page via deep link or navigation
        if (uri.path == '/home' || uri.host == 'home') {
          final id = uri.queryParameters['id'];
          return MaterialPageRoute(builder: (_) => HomePage(deepLinkId: id));
        }

        // Fallback
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: $routeName')),
          ),
        );
      },
    );
  }
}
