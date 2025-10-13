import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_glass/liquid_glass.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/testliquid.dart';

class TabletHomeScreen extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? description;

  const TabletHomeScreen({
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
        ],
      ),
    );
  }
}
