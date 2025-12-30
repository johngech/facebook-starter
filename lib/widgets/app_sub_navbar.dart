import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppSubNavbar extends StatefulWidget {
  const AppSubNavbar({super.key});

  @override
  State<AppSubNavbar> createState() => _AppSubNavbarState();
}

class _AppSubNavbarState extends State<AppSubNavbar> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/friends',
    '/search', // placeholder for message
    '/search', // placeholder for video
    '/search', // placeholder for notifications
    '/search', // placeholder for marketplace
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(0, Icons.home),
          _buildIconButton(1, Icons.group),
          _buildIconButton(2, Icons.message),
          _buildIconButton(3, Icons.video_library_sharp),
          _buildIconButton(4, Icons.notifications),
          _buildIconButton(5, Icons.shopping_bag),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon) {
    return AppIconButton(
      fontWeight: FontWeight.w500,
      iconSize: 24,
      onPressed: () => _onItemTapped(index),
      icon: icon,
      iconColor: _selectedIndex == index
          ? Theme.of(context).primaryColor
          : Colors.grey,
    );
  }
}
