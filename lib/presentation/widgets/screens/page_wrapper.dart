import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/mobile_appbar.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/fotter.dart';

class PageWrapper extends StatefulWidget {
  final Widget childWidget;
  final Widget? appbar;
  final Widget? filters;
  const PageWrapper({
    super.key,
    required this.childWidget,
    this.appbar,
    this.filters,
  });

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Color(0xFF1A0033), // deep purple in center
                    Colors.black, // black at edges
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/backgroundstars.gif', // your image path
          //     fit: BoxFit.cover,
          //   ),
          // ),
          if (screenWidth > 1000) ...[
            CustomScrollView(
              slivers: [
                ?widget.appbar,
                ?widget.filters,
                SliverToBoxAdapter(child: widget.childWidget),
                SliverPadding(
                  padding: screenWidth >= 1000
                      ? EdgeInsets.only(right: screenWidth / 2)
                      : EdgeInsets.zero,
                  sliver: SliverFooter(
                    imagePath: 'assets/eye.gif',
                    text: 'No more Arts',
                    buttonText: 'testst',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ] else ...[
            CustomScrollView(
              slivers: [
                ?widget.appbar,
                ?widget.filters,
                SliverToBoxAdapter(child: widget.childWidget),
                SliverPadding(
                  padding: screenWidth >= 1000
                      ? EdgeInsets.only(right: screenWidth / 2)
                      : EdgeInsets.zero,
                  sliver: SliverFooter(
                    imagePath: 'assets/eye.gif',
                    text: 'No more Arts',
                    buttonText: 'testst',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
