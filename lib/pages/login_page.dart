import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool showLoginCard = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleLoginCard({bool? visible}) {
    final shouldShow = visible ?? !showLoginCard;
    setState(() {
      showLoginCard = shouldShow;
      if (shouldShow) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password wajib diisi")),
      );
      return;
    }

    setState(() => _isLoading = true);


    int resCode = await Backend.doLogin(email, password);
    print(resCode);

    // try {

      

    //   final url = Uri.parse('http://192.168.0.121:3105/api/v1/auth/login');

    //   final response = await http.post(
    //     url,
    //     headers: {
    //       'Authorization':
    //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTk3NDE1NDIsImp3aSI6ImE2ZDdlMjVlLTg0NjEtNDk2ZC1hZTRkLWE0YmY4NjgwYTY3YSIsInBpZCI6MSwic3ViIjoiMGI4N2I2MWMtYTIwYy0xMWYwLWJhNDktZDg0M2FlNWZkNTFjIn0.Nm2IsIMFC5cHzDdVtGn9ObG7Ap5OTlJK4-K4plJsJBQ',
    //       'Signature': 'unVxwIkeyELe6iloW0guo694oK4BcaBJHkLv04h1dx6y/YuN2wrxWzoLtyBsXwOfSFX1yno/ajelhXrPkQ9YjA==',
    //       'Timestamp': '1759684626182',
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode({
    //       "email": email,
    //       "password": password,
    //     }),
    //   );

    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("Login sukses! Selamat datang ${data['user']?['email'] ?? email}")),
    //     );

    //     // TODO: pindah ke halaman home setelah login sukses
    //     // Navigator.pushReplacementNamed(context, '/home');
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("Login gagal (${response.statusCode})")),
    //     );
    //   }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Terjadi kesalahan: $e")),
    //   );
    // } finally {
    //   setState(() => _isLoading = false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4749A0),
      body: Stack(
        children: [
          // Layout utama
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bagian atas - teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 48),
                      Text(
                        "Hi, There",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "I'm your personal Financial Auditor.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Together, we'll keep your finances clear, balanced and in control.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),

                  // Bagian bawah - tombol
                  if (!showLoginCard)
                    Column(
                      children: [
                        const Text(
                          "Lets Get Started!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF4749A0),
                            minimumSize: const Size(300, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () => _toggleLoginCard(visible: true),
                          child: const Text("Continue"),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "or",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.network(
                            'https://developers.google.com/identity/images/g-logo.png',
                            height: 20,
                          ),
                          label: const Text(
                            "Sign in with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(300, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // Layer semi transparan untuk tap di luar card
          if (showLoginCard)
            GestureDetector(
              onTap: () => _toggleLoginCard(visible: false),
              child: AnimatedOpacity(
                opacity: showLoginCard ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

          // Animated login card (muncul dari bawah + bisa di-swipe)
          Align(
            alignment: Alignment.bottomCenter,
            child: SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta != null &&
                      details.primaryDelta! > 10) {
                    _toggleLoginCard(visible: false);
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Text(
                        "I am Ready",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF4749A0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4749A0),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xFF4749A0)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
