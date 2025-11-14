import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/mobile_item_view.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/responsive_item_view_page.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/1.jpg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/2.png',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/3.jpg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/4.jpg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/5.jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/6.jpg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/1.jpg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/2.png',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/3.jpg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/4.jpg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/5.jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/6.jpg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/1.jpg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/2.png',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/3.jpg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/4.jpg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/5.jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/6.jpg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/1.jpg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/2.png',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/3.jpg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/4.jpg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/5.jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/6.jpg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: MasonryGridView.count(
        // 👇 let parent Sliver handle scrolling
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,

        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              final item = items[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResponsiveItemPage(
                    imagePath: item['image']!,
                    title: item['title']!,
                    description: item['description']!,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 29, 29, 29),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(30, 0, 0, 0),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                      bottom: Radius.circular(16),
                    ),
                    child: Image.asset(item['image']!, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 2,
                      left: 8,
                      right: 6,
                    ),
                    child: Text(
                      item['title']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.orbitron(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom: 10,
                      left: 8,
                      right: 6,
                    ),

                    child: Text(
                      item['description']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.orbitron(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
