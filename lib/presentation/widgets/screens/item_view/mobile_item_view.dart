import 'package:flutter/material.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 195, 186, 158),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BackButton(), Text('homescreen Mobile')],
          ),
        ),
      ),
    );
  }
}
