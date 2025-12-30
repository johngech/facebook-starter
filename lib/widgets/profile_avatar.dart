import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.radius = 100});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: const Color.fromARGB(255, 214, 214, 214),
        child: AppIcon(icon: Icons.person, size: radius * 0.5),
      ),
    );
  }
}
