import 'dart:async';
import 'package:facebook/app_widgets.dart';
import 'package:facebook/data/login_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void handleOnSubmit(LoginData data) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      if (mounted) {
        context.go("/home");
      }
    } catch (e) {
      // Handle error, e.g., show snackbar
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(title: "Login", onBackPressed: () => context.go("/")),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 30,
            children: [
              const LoginScreenHeader(),
              LoginForm(onSubmit: handleOnSubmit),
              const LoginScreenFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Icon(Icons.facebook, size: 80, color: Theme.of(context).primaryColor),
        Text(
          "facebook",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Meta © 2025", style: TextStyle(color: Colors.grey));
  }
}
