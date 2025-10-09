import 'package:flutter/material.dart';

class Tab3Page extends StatelessWidget {
  const Tab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF4749A0),
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
            // alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Report",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(46, 0, 46, 0),
                  child: SizedBox(
                    height: 160,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: _buildBars(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Keterangan legenda
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _legend(color: Colors.white.withOpacity(0.8), text: "Minggu ini"),
                    const SizedBox(width: 16),
                    // _legend(color: Colors.white.withOpacity(0.3), text: "Minggu lalu"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBars() {
    final days = ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"];
    // Data tinggi batang (misalnya)
    final currentWeek = [40.0, 80.0, 100.0, 100.0, 50.0, 70.0, 60.0];
    // final lastWeek = [30.0, 60.0, 90.0, 80.0, 40.0, 60.0, 50.0];

    return List.generate(days.length, (index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Dua batang — minggu lalu di belakang, minggu ini di depan
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Batang minggu lalu (lebih transparan)
              // Container(
              //   height: lastWeek[index],
              //   width: 18,
              //   decoration: BoxDecoration(
              //     color: Colors.white.withOpacity(0.3),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              // Batang minggu ini
              Container(
                height: currentWeek[index],
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Label hari
          Text(
            days[index],
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }

  Widget _legend({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
