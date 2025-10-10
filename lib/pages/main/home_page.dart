import 'package:flutter/material.dart';
import 'tab_home.dart';
import 'tab_history.dart';
import 'tab_report.dart';
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
  final pages = const [TabHome(), TabReport(), TabHistory(), Tab4Page()];

  @override
  void initState() {
    super.initState();
    _setStatusBarForTab(index); // set status bar sesuai tab awal
  }

  void _setStatusBarForTab(int i) {
    // if (i == 0) {
      // 🟦 Tab Home → biru tua
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF4749A0),
          statusBarIconBrightness: Brightness.light,
        ),
      );
    // } else {
    //   // ⚪ Tab lainnya → putih
    //   SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //       statusBarColor: Colors.white,
    //       statusBarIconBrightness: Brightness.dark,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (i) {
          setState(() => index = i);
          _setStatusBarForTab(i); // ubah warna status bar sesuai tab
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
