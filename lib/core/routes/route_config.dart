class AppRoutes {
  static PageConfig getConfigFromLocation(String location) {
    return routes.firstWhere(
      (element) => element.path == location,
      orElse: () => routes.first,
    );
  }

  static const splash = '/';
  static const onboarding = '/onboarding';
  static const responsiveLandingPage = '/responsive_landing_page';
  static const responsiveItemPage = '/responsive_item_page';

  static final routes = <PageConfig>[
    PageConfig(
      path: splash,
      showAppBar: false,
      showNavBar: false,
      showBackground: false,
      scrollable: false,
    ),
    PageConfig(
      path: onboarding,
      showAppBar: false,
      showNavBar: false,
      showBackground: false,
      scrollable: false,
    ),
    PageConfig(
      path: responsiveLandingPage,
      showAppBar: true,
      showNavBar: false,
      showBackground: true,
      scrollable: true,
    ),
    PageConfig(
      path: responsiveItemPage,
      showAppBar: true,
      showNavBar: false,
      showBackground: true,
      scrollable: true,
    ),
  ];
}

class PageConfig {
  final String path;
  final bool showAppBar;
  final bool showNavBar;
  final bool showBackground;
  final bool scrollable;

  PageConfig({
    required this.path,
    required this.showAppBar,
    required this.showNavBar,
    required this.showBackground,
    required this.scrollable,
  });
}
