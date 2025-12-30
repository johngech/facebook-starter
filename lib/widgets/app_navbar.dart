import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavbar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.showBack = true,
    this.elevation = 0,
    this.onBackPressed,
    this.fontSize = 18,
  });

  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color textColor;
  final bool showBack;
  final double elevation;
  final double fontSize;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Flexible(
        child: Row(
          children: [
            if (showBack)
              AppIconButton(
                onPressed: onBackPressed ?? () {},
                icon: Icons.arrow_back_ios,
              ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [if (actions != null) ...actions!],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
