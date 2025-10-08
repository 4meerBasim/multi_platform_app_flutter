import 'package:flutter/material.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        child: Column(children: [BackButton(), Text('homescreen desktop')]),
      ),
    );
  }
}
