import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  const BigText({super.key,
    required this.text,
    this.color = Colors.deepPurple,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

}
