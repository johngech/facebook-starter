import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 24,
    this.iconColor,
    this.fontWeight = FontWeight.w500,
  });

  final void Function() onPressed;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: iconSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
