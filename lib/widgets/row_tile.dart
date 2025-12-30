import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowTile extends StatelessWidget {
  const RowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10,
      children: [
        SizedBox(width: 60, child: ProfileAvatar()),
        SizedBox(
          child: AppElevatedButton(
            backgroundColor: const Color.fromARGB(
              255,
              223,
              222,
              222,
            ).withValues(alpha: 0.8),
            onPressed: () => context.go("/search"),
            label: "What's on your mind?",
            textColor: Colors.black.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
