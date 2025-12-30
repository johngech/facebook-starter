import 'dart:async';

import 'package:facebook/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => context.go("/"));
    return Scaffold(
      appBar: AppNavbar(
        title: "facebook",
        fontSize: 20,
        textColor: Theme.of(context).primaryColor,
        showBack: false,
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
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.sizeOf(context).height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Icon(
                Icons.facebook,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: AppElevatedButton(
                onPressed: () => context.go("/home"),
                label: "Get Started",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
