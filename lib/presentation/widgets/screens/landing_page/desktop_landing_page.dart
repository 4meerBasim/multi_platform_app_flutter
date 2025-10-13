import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/mobile_item_view.dart';
import 'package:multi_platform_media_player/presentation/widgets/screens/item_view/responsive_item_view_page.dart';

class DesktopLandingPage extends StatefulWidget {
  const DesktopLandingPage({super.key});

  @override
  State<DesktopLandingPage> createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  final items = [
    {
      'title': 'The Persistence of Memory',
      'description': 'Audio works that convey thoughts, ideas, and narratives.',
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
      'description': 'Digital creations blending function with visual design.',
      'image': 'assets/6.jpg',
    },
    {
      'title': 'The Persistence of Memory',
      'description': 'Audio works that convey thoughts, ideas, and narratives.',
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
      'description': 'Digital creations blending function with visual design.',
      'image': 'assets/6.jpg',
    },
    {
      'title': 'The Persistence of Memory',
      'description': 'Audio works that convey thoughts, ideas, and narratives.',
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
      'description': 'Digital creations blending function with visual design.',
      'image': 'assets/6.jpg',
    },
    {
      'title': 'The Persistence of Memory',
      'description': 'Audio works that convey thoughts, ideas, and narratives.',
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
      'description': 'Digital creations blending function with visual design.',
      'image': 'assets/6.jpg',
    },
  ];
  String? selectedImage;
  @override
  void initState() {
    super.initState();
    if (items.isNotEmpty) {
      selectedImage = items.first['image'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 1400
        ? 2
        : 2 + ((screenWidth - 1400) ~/ 400) + 1;

    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Left grid
          SizedBox(
            width: screenWidth / 2,
            height: screenHeight * 0.8, // constrain height
            child: MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedImage = item['image'];
                    });
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
                          ),
                          child: Image.asset(
                            item['image'] ?? 'assets/placeholder.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item['title'] ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 10,
                          ),
                          child: Text(
                            item['description'] ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.orbitron(
                              color: Colors.white,
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
          ),

          const SizedBox(width: 20),
          // Right preview image
          // Right preview image
          Container(
            height: screenHeight * 0.8,
            alignment: Alignment.center, // centers the content inside this half
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                selectedImage ?? 'assets/placeholder.png',
                fit: BoxFit.contain, // keep full image visible, centered
              ),
            ),
          ),
        ],
      ),
    );
  }
}
