import 'package:flutter/material.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(children: [BackButton(), Text('homescreen tablet')]),
      ),
    );
  }
}
