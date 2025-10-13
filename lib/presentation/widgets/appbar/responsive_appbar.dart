import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/desktop_appbar.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/mobile_appbar.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/desktop_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/mobile_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/tablet_landing_page.dart';

class ResponsiveAppbar extends StatelessWidget {
  const ResponsiveAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetHelper(
      desktop: DesktopAppbar(),
      mobile: MobileAppbar(),
      tablet: MobileAppbar(),
    );
  }
}
