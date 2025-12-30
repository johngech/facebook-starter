import 'package:facebook/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/home',
    '/friends',
    '/search',
    '/search',
    '/search',
    '/search',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_sharp),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Marketplace',
          ),
        ],
      ),
    );
  }
}

GoRouter appRoute() => GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: "/friends",
          builder: (context, state) => const FriendsScreen(),
        ),
        GoRoute(
          path: "/search",
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
