import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/desktop_item_view.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/mobile_item_view.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/tablet_item_view.dart';

class ResponsiveItemPage extends StatelessWidget {
  const ResponsiveItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetHelper(
      desktop: DesktopHomeScreen(),
      mobile: MobileHomeScreen(),
      tablet: TabletHomeScreen(),
    );
  }
}
