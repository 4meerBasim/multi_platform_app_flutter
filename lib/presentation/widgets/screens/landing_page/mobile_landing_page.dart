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
        'title': 'The Starry Night',
        'description': 'Art that captures the rhythm and harmony of life.',
        'image': 'assets/download (1).jpeg',
      },
      {
        'title': 'Mona Lisa',
        'description': 'Moving images that tell stories and capture moments.',
        'image': 'assets/download (2).jpeg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/download (3).jpeg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/download (4).jpeg',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/download (5).jpeg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/download (6).jpeg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/download (7).jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/download.jpeg',
      },
      {
        'title': 'The Starry Night',
        'description': 'Art that captures the rhythm and harmony of life.',
        'image': 'assets/download (1).jpeg',
      },
      {
        'title': 'Mona Lisa',
        'description': 'Moving images that tell stories and capture moments.',
        'image': 'assets/download (2).jpeg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/download (3).jpeg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/download (4).jpeg',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/download (5).jpeg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/download (6).jpeg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/download (7).jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/download.jpeg',
      },
      {
        'title': 'The Starry Night',
        'description': 'Art that captures the rhythm and harmony of life.',
        'image': 'assets/download (1).jpeg',
      },
      {
        'title': 'Mona Lisa',
        'description': 'Moving images that tell stories and capture moments.',
        'image': 'assets/download (2).jpeg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/download (3).jpeg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/download (4).jpeg',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/download (5).jpeg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/download (6).jpeg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/download (7).jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/download.jpeg',
      },
      {
        'title': 'The Starry Night',
        'description': 'Art that captures the rhythm and harmony of life.',
        'image': 'assets/download (1).jpeg',
      },
      {
        'title': 'Mona Lisa',
        'description': 'Moving images that tell stories and capture moments.',
        'image': 'assets/download (2).jpeg',
      },
      {
        'title': 'The Persistence of Memory',
        'description':
            'Audio works that convey thoughts, ideas, and narratives.',
        'image': 'assets/download (3).jpeg',
      },
      {
        'title': 'The Birth of Venus',
        'description': 'Selected works that inspire and resonate the most.',
        'image': 'assets/download (4).jpeg',
      },
      {
        'title': 'Girl with a Pearl Earring',
        'description': 'Visual and literary masterpieces preserving knowledge.',
        'image': 'assets/download (5).jpeg',
      },
      {
        'title': 'The Night Watch',
        'description': 'Frozen moments in time, capturing beauty and emotion.',
        'image': 'assets/download (6).jpeg',
      },
      {
        'title': 'The Scream',
        'description': 'Artistic worlds created for imagination and play.',
        'image': 'assets/download (7).jpeg',
      },
      {
        'title': 'Guernica',
        'description':
            'Digital creations blending function with visual design.',
        'image': 'assets/download.jpeg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            onTap: () => context.push('/details'),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
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
