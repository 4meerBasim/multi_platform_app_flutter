import 'package:flutter/material.dart';

enum PageTransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromBottom,
  scale,
  none,
}

Widget buildPageTransition({
  required Widget child,
  required Animation<double> animation,
  PageTransitionType type = PageTransitionType.fade,
}) {
  switch (type) {
    case PageTransitionType.fade:
      return FadeTransition(opacity: animation, child: child);

    case PageTransitionType.slideFromRight:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      );
    case PageTransitionType.slideFromLeft:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0), // from left
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInCubic, // 👈 slow in → fast out
            reverseCurve:
                Curves.fastEaseInToSlowEaseOut, // reverse: fast out → slow in
          ),
        ),
        child: child,
      );

    case PageTransitionType.slideFromBottom:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // from bottom
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

    case PageTransitionType.scale:
      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.9,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        child: child,
      );

    case PageTransitionType.none:
      return child;
  }
}
