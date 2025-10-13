import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_glass/liquid_glass.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/testliquid.dart';

class DesktopItemView extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? description;

  const DesktopItemView({
    super.key,
    this.imagePath,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen image
          Positioned.fill(
            child: imagePath != null
                ? Image.asset(imagePath!, fit: BoxFit.cover)
                : Container(color: Colors.grey[900]),
          ),

          // Optional dark overlay for readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // Back button at top
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: FrostedMoreButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  size: 45,
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
            ),
          ),

          // Title and description at bottom
          if (title != null || description != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 40,
              child: LiquidGlass(
                blur: 3.0,
                opacity: 0.08,
                tint: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title!,
                          style: GoogleFonts.orbitron(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      if (title != null && description != null)
                        const SizedBox(height: 8),
                      if (description != null)
                        Text(
                          description!,
                          style: GoogleFonts.orbitron(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
