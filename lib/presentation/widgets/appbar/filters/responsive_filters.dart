import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/filters/mobile_filters.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/mobile_appbar.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/desktop_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/mobile_landing_page.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/landing_page/tablet_landing_page.dart';

class ResponsiveFilters extends StatelessWidget {
  const ResponsiveFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetHelper(
      desktop: MobileFilters(),
      mobile: MobileFilters(),
      tablet: MobileFilters(),
    );
  }
}
