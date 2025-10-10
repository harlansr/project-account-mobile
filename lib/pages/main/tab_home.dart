import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../services/globals.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../components/card/upcoming_card.dart';
import '../../components/card/menu_item_card.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHome> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    _setStatusBarColor(); // pastikan di-set saat pertama kali masuk halaman
  }

  void _setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF4749A0), // warna status bar
        statusBarIconBrightness: Brightness.light, // ikon (jam/sinyal) jadi putih
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // untuk berjaga-jaga, jika halaman rebuild akibat navigasi
    _setStatusBarColor();

    final List<Map<String, dynamic>> menus = [
      {
        'title': 'Transfer', 
        'color': const Color(0xFFEBF8FE), 
        'color_icon': const Color(0xFF26A3F5),
        'onTap': () => debugPrint('Klik NamaMenu 1'),
        'icon': Icons.repeat,
      },
      {
        'title': 'Pemasukan', 
        'color': const Color(0xFFEAF6F2), 
        'color_icon': const Color(0xFF28BB74), 
        'icon': Icons.payments_outlined,
        'onTap': () => debugPrint('Klik NamaMenu 2'),
      },
      {
        'title': 'Bayar', 
        'color': const Color.fromARGB(255, 255, 235, 235), 
        'color_icon': const Color.fromARGB(255, 241, 92, 92), 
        'icon': Icons.payment,
        'onTap': () => debugPrint('Klik NamaMenu 3'),
      },
      {
        'title': 'Lainnya', 
        'color': const Color(0xFFF1EEFF), 
        'color_icon': const Color(0xFF856DFF), 
        'icon': Icons.dashboard_outlined,
        'onTap': () => debugPrint('Klik NamaMenu 4'),},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: const Color(0xFF4749A0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Header biru
                Container(
                  width: double.infinity,
                  color: const Color(0xFF4749A0),
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 75),
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

                // Card putih
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: SizedBox(
                          width: double.infinity,
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
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(height: 2),
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
                      ),
                    ),
                  ),
                ),

                // Menu grid
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: menus
                            .map((menu) => MenuItemCard(
                                  title: menu['title']!,
                                  onTap: menu['onTap'],
                                  color: menu['color'],
                                  colorIcon: menu['color_icon'],
                                  icon: menu['icon'],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),

                // Upcoming payments
                Transform.translate(
                  offset: const Offset(0, -5),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 450),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 6),
                          child: Text(
                            'Upcoming Payment',
                            style: TextStyle(
                              color: Color.fromARGB(255, 56, 56, 56),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        UpcomingCard(
                          title: "Test",
                          onTap: () => print("TAP CARD 1"),
                          desc: 'Rp 15,000',
                          time: '12:08',
                        ),
                        UpcomingCard(
                          title: "Test",
                          onTap: () => print("TAP CARD 1"),
                          desc: 'Rp 15,000',
                          time: '12:08',
                        ),
                        UpcomingCard(
                          title: "Test",
                          onTap: () => print("TAP CARD 1"),
                          desc: 'Rp 15,000',
                          time: '12:08',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
