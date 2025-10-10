import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String title;            // nama / teks di bawah icon
  final IconData icon;           // ikon di tengah kotak
  final VoidCallback? onTap;     // aksi saat di-tap
  final Color color;             // warna background kotak
  final Color colorIcon;         // warna ikon

  const MenuItemCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.color = const Color.fromARGB(255, 199, 205, 221),
    this.colorIcon = const Color.fromARGB(255, 137, 142, 155),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: colorIcon,
              size: 32,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
