import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_glass/liquid_glass.dart';
import 'package:multi_platform_media_player/presentation/widgets/appbar/testliquid.dart';

class DesktopAppbar extends StatelessWidget {
  const DesktopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverPadding(
      padding: EdgeInsets.only(right: screenWidth / 2),
      sliver: SliverAppBar(
        expandedHeight: 200, // set a nice expanded height
        pinned: true, // keeps title visible when scrolling
        backgroundColor: const Color.fromARGB(255, 10, 1, 32),
        toolbarHeight: 70,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          background: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
            child: Image.asset('assets/appbara.gif', fit: BoxFit.cover),
          ),
          title: ClipRRect(
            child: Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              color: const Color.fromARGB(0, 53, 13, 139),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LiquidGlass(
                          blur: 1.0,
                          opacity: 0.12,
                          tint: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pixiverse',
                                  style: GoogleFonts.orbitron(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Finding The Best Art',
                                  style: GoogleFonts.orbitron(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    FrostedMoreButton(),
                  ],
                ),
              ),
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
          ),
        ),
      ),
    );
  }
}
