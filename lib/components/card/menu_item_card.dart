import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String title;         // nama / teks di bawah icon
  final VoidCallback? onTap;  // aksi saat di-tap
  final Color color;          // warna background icon

  const MenuItemCard({
    super.key,
    required this.title,
    this.onTap,
    this.color = const Color.fromARGB(255, 199, 205, 221),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
