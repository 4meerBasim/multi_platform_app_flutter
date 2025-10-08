import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/responsive_item_view_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/responsive_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/page_wrapper.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); //in case widget dont have context
GoRouter createRouter() {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.responsiveLandingPage,
    routes: [
      GoRoute(
        name: 'responsive_landing_page',
        path: AppRoutes.responsiveLandingPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PageWrapper(childWidget: ResponsiveLandingPage()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        name: 'responsive_item_page',
        path: AppRoutes.responsiveItemPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PageWrapper(childWidget: ResponsiveItemPage()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
