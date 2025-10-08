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
      appBar: AppBar(title: Text('Gallery')),
      body: widget.childWidget,
    );
  }
}
