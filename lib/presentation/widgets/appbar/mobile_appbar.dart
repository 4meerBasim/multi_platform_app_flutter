import 'package:flutter/material.dart';

class MobileAppbar extends StatelessWidget {
  const MobileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300, // set a nice expanded height
      pinned: true, // keeps title visible when scrolling
      backgroundColor: Colors.lightBlueAccent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('mose.png', fit: BoxFit.cover),
        title: Text('test'),
      ),
    );
  }
}
