import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demo — you can later replace this with your real content
    final items = [
      {
        'title': 'Music',
        'icon': Icons.music_note,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Videos',
        'icon': Icons.video_library,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Podcasts',
        'icon': Icons.podcasts,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Favorites',
        'icon': Icons.favorite,
        'route': AppRoutes.responsiveItemPage,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4FDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 items per row for mobile
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
            children: items.map((item) {
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => context.push(item['route'] as String),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        size: 42,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
