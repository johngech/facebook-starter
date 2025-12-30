import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        title: "facebook",
        fontSize: 20,
        textColor: Theme.of(context).primaryColor,
        onBackPressed: () => context.go("/"),
        actions: [
          AppIconButton(
            onPressed: () {},
            icon: Icons.add,
            fontWeight: FontWeight.w600,
          ),
          AppIconButton(
            onPressed: () {},
            icon: Icons.search,
            fontWeight: FontWeight.w600,
          ),
          AppIconButton(
            onPressed: () {},
            icon: Icons.menu,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSubNavbar(),
          // Status Update
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                ProfileAvatar(radius: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Dummy posts
              itemBuilder: (context, index) {
                return PostWidget(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
