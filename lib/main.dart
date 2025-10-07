import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/desktop_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/mobile_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/tablet_landing_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: ResponsiveWidgetHelper(
        mobile: MobileLandingPage(),
        tablet: TabletLandingPage(),
        desktop: DesktopLandingPage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
