import 'package:flutter/material.dart';
import 'tab1_page.dart';
import 'tab2_page.dart';
import 'tab3_page.dart';
import 'tab4_page.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String? deepLinkId;
  const HomePage({super.key, this.deepLinkId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final pages = const [Tab1Page(), Tab2Page(), Tab3Page(), Tab4Page()];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF4749A0),
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // wajib untuk >3 item
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'), // ganti icon biar beda
        ],
      ),
    );
  }
}
