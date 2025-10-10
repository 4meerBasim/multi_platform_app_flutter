import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/mobile_appbar.dart';

class PageWrapper extends StatefulWidget {
  final Widget childWidget;
  final Widget appbar;
  const PageWrapper({
    super.key,
    required this.childWidget,
    required this.appbar,
  });

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          widget.appbar,
          SliverToBoxAdapter(child: widget.childWidget),
        ],
      ),
    );
  }
}
