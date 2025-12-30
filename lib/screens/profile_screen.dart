import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileAvatar(radius: 50),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Profile Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text("Email"),
                  subtitle: const Text("john@example.com"),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text("Phone"),
                  subtitle: const Text("123-456-7890"),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text("Location"),
                  subtitle: const Text("New York, USA"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
