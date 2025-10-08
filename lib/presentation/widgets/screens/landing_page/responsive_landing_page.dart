import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/desktop_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/mobile_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/tablet_landing_page.dart';

class ResponsiveLandingPage extends StatelessWidget {
  const ResponsiveLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetHelper(
      desktop: DesktopLandingPage(),
      mobile: MobileLandingPage(),
      tablet: TabletLandingPage(),
    );
  }
}
