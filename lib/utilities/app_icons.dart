import 'package:flutter/material.dart';
class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  const AppIcons({super.key,
    required this.icon,
    this.iconColor = const Color(0xFF747384),
    this.backgroundColor = const Color(0xFFA8A3C1),
    this.size = 40
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
