import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        title: "Friends",
        onBackPressed: () => context.go("/home"),
      ),
      body: ListView.builder(
        itemCount: 10, // Dummy friends
        itemBuilder: (context, index) {
          return ListTile(
            leading: ProfileAvatar(radius: 25),
            title: Text("Friend ${index + 1}"),
            subtitle: const Text("Online"),
            onTap: () => context.go("/profile"),
          );
        },
      ),
    );
  }
}
