import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        title: "Search...",
        onBackPressed: () => context.go("/home"),
      ),
      body: Center(child: Text("Search Screen..")),
    );
  }
}
