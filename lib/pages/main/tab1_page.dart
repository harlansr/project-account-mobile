import 'package:flutter/material.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {
  Future<void> _onRefresh() async {
    // simulasi loading 2 detik
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("Halaman di-refresh");
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menus = [
      {'title': 'Menu', 'onTap': () => debugPrint('Klik NamaMenu 1')},
      {'title': 'Menu', 'onTap': () => debugPrint('Klik NamaMenu 2')},
      {'title': 'Menu', 'onTap': () => debugPrint('Klik NamaMenu 3')},
      {'title': 'Lainnya', 'onTap': () => debugPrint('Klik Lainnya')},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: const Color(0xFF4749A0),
          child: Stack(
            children: [
              // Konten yang bisa di-scroll
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(), // penting agar bisa pull-to-refresh
                child: Column(
                  children: [
                    // Header
                    Container(
                      height: 190,
                      width: double.infinity,
                      color: const Color(0xFF4749A0),
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hi, Harlan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Pengeluaran mu masih dalam batas aman, semoga target nya tercapai',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80), // ruang di bawah card agar tidak tertutup

                    // Menu
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: menus.map((menu) {
                          return GestureDetector(
                            onTap: menu['onTap'],
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 199, 204, 210),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  menu['title']!,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 300), // dummy space biar scroll terasa
                  ],
                ),
              ),

              // Card putih mengambang
              Positioned(
                top: 140,
                left: 16,
                right: 16,
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Sisa limit Pengeluaran Bulan ini',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Rp 3.500.000',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
