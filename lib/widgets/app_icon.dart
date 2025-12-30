import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon, this.color, this.size = 24});

  final IconData icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Icon(icon, color: color, size: size),
    );
  }
}
