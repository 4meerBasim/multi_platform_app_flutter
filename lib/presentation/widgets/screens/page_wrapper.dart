import 'package:flutter/material.dart';

class PageWrapper extends StatefulWidget {
  final Widget childWidget;
  const PageWrapper({super.key, required this.childWidget});

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300, // set a nice expanded height
            pinned: true, // keeps title visible when scrolling
            backgroundColor: Colors.lightBlueAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/download (6).jpeg',
                fit: BoxFit.cover,
              ),
              title: Text('test'),
            ),
          ),
          SliverToBoxAdapter(child: widget.childWidget),
        ],
      ),
    );
  }
}
