import 'package:flutter/material.dart';
import 'tab1_page.dart';
import 'tab2_page.dart';
import 'tab3_page.dart';

class HomePage extends StatefulWidget {
  final String? deepLinkId;
  const HomePage({super.key, this.deepLinkId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [Tab1Page(), Tab2Page(), Tab3Page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deepLinkId != null
            ? 'Home (Deep Link ID: ${widget.deepLinkId})'
            : 'Home'),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Tab 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tab 3'),
        ],
      ),
    );
  }
}
