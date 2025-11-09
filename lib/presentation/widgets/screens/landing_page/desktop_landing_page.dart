import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Row(
        children: [
        // Left half - AppBar and scrollable image list
        Expanded(
          child: Column(
            children: [
              // AppBar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Media Gallery',
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Scrollable list of images
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isSelected = selectedImage == item['image'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedImage = item['image'];
                              });
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color.fromARGB(255, 45, 45, 60)
                                    : const Color.fromARGB(255, 29, 29, 29),
                                borderRadius: BorderRadius.circular(16),
                                border: isSelected
                                    ? Border.all(
                                        color: Colors.blueAccent,
                                        width: 2,
                                      )
                                    : null,
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected
                                        ? Colors.blueAccent.withValues(alpha: 0.3)
                                        : const Color.fromARGB(30, 0, 0, 0),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // Thumbnail
                                  ClipRRect(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(16),
                                    ),
                                    child: SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: Image.asset(
                                        item['image'] ?? 'assets/placeholder.png',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[800],
                                            child: const Icon(
                                              Icons.broken_image,
                                              color: Colors.white54,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // Title and description
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            item['title'] ?? '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.orbitron(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            item['description'] ?? '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.orbitron(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // Divider
        Container(
          width: 1,
          color: const Color.fromARGB(255, 60, 60, 60),
        ),

        // Right half - Preview (starts from top)
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 15, 15, 15),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: selectedImage != null
                      ? Image.asset(
                          selectedImage!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.broken_image,
                                      size: 64,
                                      color: Colors.white54,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Image not found',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: Text(
                              'No image selected',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
