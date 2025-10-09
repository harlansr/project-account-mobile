import 'package:flutter/material.dart';
import '../../components/card/history_card.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      appBar: AppBar(
        backgroundColor: const Color(0xFF4749A0), // Biru tua
        elevation: 0,
        centerTitle: false, // Biar teks rata kiri
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "Search"
            //   ),
            // ),

            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
            HistoryCard(title: "title", desc: "desc"),
          ],
        ),
      
      ),
    );
  }
}
