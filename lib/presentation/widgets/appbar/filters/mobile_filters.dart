import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileFilters extends StatefulWidget {
  const MobileFilters({super.key});

  @override
  State<MobileFilters> createState() => _MobileFiltersState();
}

class _MobileFiltersState extends State<MobileFilters> {
  int selectedIndex = 0;

  final List<String> filters = [
    'All',
    'Popular',
    'Trending',
    'New',
    'Abstract',
    'Modern',
    'Classic',
    'Nature',
    'Portrait',
    '3D Art',
    'Photography',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,

      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            // Horizontal Filter List
            ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final bool isSelected = index == selectedIndex;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: isSelected
                          ? const [
                              Color.fromARGB(255, 39, 6, 129),
                              Color.fromARGB(255, 11, 9, 94),
                            ]
                          : [Colors.transparent, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: isSelected
                        ? null
                        : Border.all(
                            color: const Color.fromARGB(
                              83,
                              255,
                              255,
                              255,
                            ).withOpacity(0.5),
                            width: 0.5,
                          ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : [],
                  ),

                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    splashColor: Colors.transparent, // remove splash
                    highlightColor: Colors.transparent, // remove highlight
                    borderRadius: BorderRadius.circular(10), // match container
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style: GoogleFonts.orbitron(
                        color: isSelected
                            ? Colors.white
                            : const Color.fromARGB(177, 255, 255, 255),
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: isSelected ? 16 : 14,
                      ),
                      child: Text(filters[index]),
                    ),
                  ),
                );
              },
            ),

            // Fading effect on right edge
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
