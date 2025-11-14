import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/filters/responsive_filters.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/responsive_appbar.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/responsive_item_view_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/responsive_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/onboarding/onboarding_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/page_wrapper.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(); //in case widget dont have context
GoRouter createRouter() {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        name: 'splash',
        path: AppRoutes.splash,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        name: 'onboarding',
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: OnboardingPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  // Smooth fade + scale transition
                  const curve = Curves.easeInOutCubic;

                  var fadeAnimation = CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  );

                  var scaleAnimation = Tween<double>(
                    begin: 0.95,
                    end: 1.0,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ));

                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: ScaleTransition(
                      scale: scaleAnimation,
                      child: child,
                    ),
                  );
                },
          );
        },
      ),
      GoRoute(
        name: 'responsive_landing_page',
        path: AppRoutes.responsiveLandingPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PageWrapper(
              appbar: ResponsiveAppbar(),
              filters: ResponsiveFilters(),
              childWidget:
                  ResponsiveLandingPage(), // 👈 REMOVE SliverToBoxAdapter
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  // Smooth slide and fade transition
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  var fadeAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeIn,
                  );

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(opacity: fadeAnimation, child: child),
                  );
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
