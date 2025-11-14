import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late AnimationController _exitController;
  late AnimationController _floatingCircleController;

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      title: 'Discover Your Media',
      description:
          'Explore a world of entertainment with our multi-platform media player',
      centerIcon: "assets/first.png",
      floatingIcons: [
        FloatingIconConfig(
          icon: Icons.music_note,
          top: 0.2,
          right: 50,
          size: 40,
          padding: 16,
        ),
        FloatingIconConfig(
          text: '4K',
          bottom: 0.15,
          left: 50,
          size: 18,
          padding: 12,
        ),
        FloatingIconConfig(
          text: 'HD',
          bottom: 0.25,
          right: 45,
          size: 16,
          padding: 10,
        ),
      ],
      backgroundColor: Color(0xFF0A0E27), // Deep space blue
      squareColor: Color(0xFF00F5FF), // Cyan neon
      accentColor: Color(0xFFFF00FF), // Magenta neon
      isDarkBackground: true,
    ),
    OnboardingContent(
      title: 'Seamless Playback',
      description:
          'Explore a world of entertainment with our multi-platform media player',
      centerIcon: "assets/second.gif",
      floatingIcons: [
        FloatingIconConfig(
          icon: Icons.phone_android,
          top: 0.18,
          left: 35,
          size: 35,
          padding: 13,
        ),

        FloatingIconConfig(
          icon: Icons.laptop,
          bottom: 0.18,
          left: 55,
          size: 34,
          padding: 13,
        ),
      ],
      backgroundColor: Color(0xFF1A0033), // Deep purple
      squareColor: Color(0xFFFF0090), // Hot pink neon
      accentColor: Color(0xFF00FFFF), // Cyan accent
      isDarkBackground: true,
    ),
    OnboardingContent(
      title: 'Join Our Community',
      description:
          'Explore a world of entertainment with our multi-platform media player',
      centerIcon: "assets/Pixel_Robot.gif",
      floatingIcons: [
        FloatingIconConfig(
          icon: Icons.sync,
          top: 0.16,
          left: 45,
          size: 33,
          padding: 12,
        ),
        FloatingIconConfig(
          icon: Icons.download,
          top: 0.22,
          right: 55,
          size: 37,
          padding: 14,
        ),

        FloatingIconConfig(
          icon: Icons.playlist_play,
          bottom: 0.22,
          right: 45,
          size: 30,
          padding: 11,
        ),
      ],
      backgroundColor: Color(0xFF0D1B2A), // Dark navy
      squareColor: Color(0xFF00FF41), // Matrix green
      accentColor: Color(0xFFFFFF00), // Yellow accent
      isDarkBackground: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..forward();

    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..forward();

    _exitController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 1.0,
    );

    // Floating circle animation controller - slow continuous animation
    _floatingCircleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    _exitController.dispose();
    _floatingCircleController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });

    // Reset and replay animations
    _fadeController.reset();
    _scaleController.reset();
    _slideController.reset();
    _fadeController.forward();
    _scaleController.forward();
    _slideController.forward();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    // Navigate immediately without exit animation
    if (mounted) {
      context.go(AppRoutes.responsiveLandingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _pages[_currentPage];
    final isDark = currentPage.isDarkBackground;
    final indicatorColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _exitController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _exitController,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(
                  parent: _exitController,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            ),
          );
        },
        child: Stack(
          children: [
            // Solid color background
            Positioned.fill(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(color: currentPage.backgroundColor),
              ),
            ),

            // Floating circle object
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _floatingCircleController,
                builder: (context, child) {
                  // Calculate circular floating motion
                  final double angle =
                      _floatingCircleController.value * 2 * math.pi;
                  final double radiusX = 80; // Horizontal movement radius
                  final double radiusY = 120; // Vertical movement radius

                  // Calculate position offset from center
                  final double offsetX = math.cos(angle) * radiusX;
                  final double offsetY =
                      math.sin(angle * 0.7) *
                      radiusY; // Slightly different frequency for more organic movement

                  return Stack(
                    children: [
                      // Large floating circle
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.6 + offsetX,
                        top: MediaQuery.of(context).size.height * 0.3 + offsetY,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                currentPage.squareColor.withValues(alpha: 0.15),
                                currentPage.accentColor.withValues(alpha: 0.08),
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.6, 1.0],
                            ),
                          ),
                        ),
                      ),
                      // Secondary smaller circle with opposite movement
                      Positioned(
                        left:
                            MediaQuery.of(context).size.width * 0.2 -
                            offsetX * 0.6,
                        top:
                            MediaQuery.of(context).size.height * 0.5 -
                            offsetY * 0.5,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                currentPage.accentColor.withValues(alpha: 0.12),
                                currentPage.squareColor.withValues(alpha: 0.06),
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  // Skip button
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: TextButton(
                  //       onPressed: _finishOnboarding,
                  //       child: Text(
                  //         'Skip',
                  //         style: GoogleFonts.orbitron(
                  //           color: indicatorColor,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Title at top
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Pixiverse',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orbitron(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: indicatorColor,
                        height: 1.2,
                      ),
                    ),
                  ),

                  // Static square container with animated icons
                  SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        // Static square background that only changes color
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 90,
                            vertical: 40,
                          ),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            width: 260,
                            height: 280,
                            decoration: BoxDecoration(
                              color: currentPage.backgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: currentPage.squareColor,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: currentPage.squareColor.withValues(
                                    alpha: 0.5,
                                  ),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: currentPage.accentColor.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 40,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 340.0),
                          child: _buildPageIndicators(),
                        ),

                        // Center icon with sliding animation (clipped inside square)
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: SizedBox(
                              width: 280,
                              height: 280,
                              child: AnimatedBuilder(
                                animation: _pageController,
                                builder: (context, child) {
                                  double value = 0.0;
                                  if (_pageController.position.haveDimensions) {
                                    value =
                                        _pageController.page! - _currentPage;
                                  }

                                  // Parallax sliding effect for center icon (reversed direction)
                                  final offset = value * -200;
                                  final easedOffset =
                                      offset *
                                      (1.0 - (value.abs().clamp(0.0, 1.0)));

                                  return Transform.translate(
                                    offset: Offset(easedOffset, 0),
                                    child: Center(
                                      child: Opacity(
                                        opacity: (1.0 - value.abs()).clamp(
                                          0.3,
                                          1.0,
                                        ),
                                        child: _buildCenterImage(
                                          currentPage
                                              .centerIcon, // <- your image field
                                          indicatorColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        // PageView with parallax floating icons
                        PageView.builder(
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: _pages.length,
                          itemBuilder: (context, index) {
                            return _buildFloatingIcons(_pages[index], index);
                          },
                        ),
                      ],
                    ),
                  ),

                  // Page indicators
                  // Animated description text with sliding animation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 0.0;
                          if (_pageController.position.haveDimensions) {
                            value = _pageController.page! - _currentPage;
                          }

                          // Parallax sliding effect for description (reversed direction)
                          final offset = value * -1300;
                          final easedOffset =
                              offset * (1.0 - (value.abs().clamp(0.0, 1.0)));

                          return Transform.translate(
                            offset: Offset(easedOffset, 0),
                            child: Text(
                              currentPage.title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.orbitron(
                                fontSize: 36,
                                color: indicatorColor,
                                height: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double value = 0.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - _currentPage;
                        }

                        // Parallax sliding effect for description (reversed direction)
                        final offset = value * -1300;
                        final easedOffset =
                            offset * (1.0 - (value.abs().clamp(0.0, 1.0)));

                        return Transform.translate(
                          offset: Offset(easedOffset, 0),
                          child: Opacity(
                            opacity: (1.0 - value.abs()).clamp(0.3, 1.0),
                            child: Text(
                              currentPage.description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.orbitron(
                                fontSize: 16,
                                color: indicatorColor.withValues(alpha: 0.8),
                                height: 1.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 70),

                  // Navigation button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? Colors.white : Colors.black,
                          foregroundColor: isDark ? Colors.black : Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                          minimumSize: Size(double.infinity, 56),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage == _pages.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: isDark ? Colors.white : Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                          minimumSize: Size(double.infinity, 56),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.orbitron(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingIcons(OnboardingContent content, int pageIndex) {
    final isDark = content.isDarkBackground;
    final iconColor = isDark ? Colors.white : Colors.black;

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - pageIndex;
        }

        // Parallax effect with ease in/out
        final parallaxOffset = value * 200;
        final easedOffset =
            parallaxOffset * (1.0 - (value.abs().clamp(0.0, 1.0)));

        return Stack(
          children: content.floatingIcons.asMap().entries.map((entry) {
            final index = entry.key;
            final iconConfig = entry.value;

            // Calculate parallax multiplier based on index
            final parallaxMultiplier = 1.0 - (index * 0.15);
            final currentOffset = easedOffset * parallaxMultiplier;

            return Positioned(
              top: iconConfig.top != null
                  ? MediaQuery.of(context).size.height * iconConfig.top!
                  : null,
              bottom: iconConfig.bottom != null
                  ? MediaQuery.of(context).size.height * iconConfig.bottom!
                  : null,
              left: iconConfig.left != null
                  ? iconConfig.left! + currentOffset
                  : null,
              right: iconConfig.right != null
                  ? iconConfig.right! - currentOffset
                  : null,
              child: Opacity(
                opacity: (1.0 - value.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(iconConfig.padding),
                  decoration: BoxDecoration(
                    color: content.squareColor, // Full opacity solid background
                    shape: iconConfig.text != null
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    borderRadius: iconConfig.text != null
                        ? BorderRadius.circular(15)
                        : null,
                  ),
                  child: iconConfig.icon != null
                      ? Icon(
                          iconConfig.icon,
                          size: iconConfig.size,
                          color: iconColor, // Full opacity icon
                        )
                      : Text(
                          iconConfig.text!,
                          style: GoogleFonts.orbitron(
                            fontSize: iconConfig.size,
                            fontWeight: FontWeight.bold,
                            color: iconColor, // Full opacity text
                          ),
                        ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildPageIndicators() {
    final isDark = _pages[_currentPage].isDarkBackground;
    final activeColor = isDark ? Colors.white : Colors.black;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 30 : 7,
          height: 6,
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

class FloatingIconConfig {
  final IconData? icon;
  final String? text;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final double padding;

  FloatingIconConfig({
    this.icon,
    this.text,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.padding,
  }) : assert(
         icon != null || text != null,
         'Either icon or text must be provided',
       );
}

class OnboardingContent {
  final String title;
  final String description;
  final String centerIcon;
  final List<FloatingIconConfig> floatingIcons;
  final Color backgroundColor;
  final Color squareColor;
  final Color accentColor;
  final bool isDarkBackground;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.centerIcon,
    required this.floatingIcons,
    required this.backgroundColor,
    required this.squareColor,
    required this.accentColor,
    required this.isDarkBackground,
  });
}

Widget _buildCenterImage(String? path, Color indicatorColor) {
  if (path == null || path.isEmpty) {
    return const SizedBox.shrink();
  }

  // SVG
  if (path.endsWith(".svg")) {
    return SvgPicture.asset(
      path,
      width: 140,
      height: 140,
      colorFilter: ColorFilter.mode(
        indicatorColor.withValues(alpha: 0.9),
        BlendMode.srcIn,
      ),
    );
  }

  // PNG, JPG, GIF (including animated GIF)
  return Image.asset(path, width: 200, height: 200, fit: BoxFit.contain);
}
