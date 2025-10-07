import 'package:flutter/material.dart';
import 'package:multi_platform_media_player/core/helpers/responsive_widget_helper.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/home_screen/desktop_home_screen.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/home_screen/mobile_home_screen.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/home_screen/tablet_home_screen.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResponsiveWidgetHelper(
                        mobile: MobileHomeScreen(),
                        tablet: TabletHomeScreen(),
                        desktop: DesktopHomeScreen(),
                      ),
                    ),
                  );
                },
                child: Text('Landing Mobile'),
              ),
              Text('Landing Mobile'),
            ],
          ),
        ),
      ),
    );
  }
}
