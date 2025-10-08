import 'package:flutter/material.dart';

class UpcomingCard extends StatelessWidget {
  final String title;
  final String desc;
  final String time;
  final VoidCallback? onTap;

  const UpcomingCard({
    super.key,
    required this.title,
    required this.desc,
    this.time = "",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        // elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12),
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: Row(
            children: [
              // Icon lingkaran kiri
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 231, 242),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),

              // Teks tengah
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              // Waktu kanan
              Text(
                time,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
