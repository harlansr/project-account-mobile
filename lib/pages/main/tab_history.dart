import 'package:flutter/material.dart';
import '../../components/card/history_card.dart';

class TabHistory extends StatelessWidget {
  const TabHistory({super.key});

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

            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "10:32",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "3 Mar",),
            HistoryCard(title: "Bayar Makan", amount: "Rp10,000", time: "1 Jan",),
          ],
        ),
      
      ),
    );
  }
}
