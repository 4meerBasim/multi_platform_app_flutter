import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      {
        'title': 'Books',
        'icon': Icons.book,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Photos',
        'icon': Icons.photo,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Games',
        'icon': Icons.games,
        'route': AppRoutes.responsiveItemPage,
      },
      {
        'title': 'Apps',
        'icon': Icons.apps,
        'route': AppRoutes.responsiveItemPage,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4FDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final rowIndex = index ~/ 2;
              final isLeft = index % 2 == 0;

              // Flip pattern: left tall/right short on even rows, left short/right tall on odd rows
              final height = (rowIndex % 2 == 1)
                  ? (isLeft ? 300.0 : 200.0)
                  : (isLeft ? 200.0 : 300.0);

              return SizedBox(
                height: height,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => context.push(items[index]['route'] as String),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image1.png'),
                        Icon(
                          items[index]['icon'] as IconData,
                          size: 42,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          items[index]['title'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
