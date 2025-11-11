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
  late AnimationController _gradientController;

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      title: 'Discover Your Media',
      description:
          'Explore a world of entertainment with our multi-platform media player',
      centerIcon: "assets/first.png",
      floatingIcons: [
        Icons.movie,
        Icons.music_note,
        Icons.video_library,
        Icons.headphones,
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
        Icons.phone_android,
        Icons.tablet_mac,
        Icons.laptop,
        Icons.tv,
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
        Icons.sync,
        Icons.download,
        Icons.favorite,
        Icons.playlist_play,
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

    // Gradient animation controller - continuously animates
    _gradientController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    _exitController.dispose();
    _gradientController.dispose();
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
            // Animated gradient background
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _gradientController,
                builder: (context, child) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          currentPage.backgroundColor,
                          Color.lerp(
                            currentPage.backgroundColor,
                            currentPage.squareColor,
                            0.2 +
                                0.1 *
                                    (1 +
                                        math.sin(
                                          _gradientController.value *
                                              2 *
                                              math.pi,
                                        )),
                          )!,
                          Color.lerp(
                            currentPage.backgroundColor,
                            currentPage.accentColor,
                            0.15 +
                                0.08 *
                                    (1 +
                                        math.cos(
                                          _gradientController.value *
                                                  2 *
                                                  math.pi +
                                              math.pi / 3,
                                        )),
                          )!,
                          currentPage.backgroundColor,
                        ],
                        stops: [
                          0.0,
                          0.3 +
                              0.1 *
                                  math.sin(
                                    _gradientController.value * 2 * math.pi,
                                  ),
                          0.7 +
                              0.1 *
                                  math.cos(
                                    _gradientController.value * 2 * math.pi,
                                  ),
                          1.0,
                        ],
                        transform: GradientRotation(
                          _gradientController.value * 2 * math.pi * 0.5,
                        ),
                      ),
                    ),
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
                            child: Stack(
                              children: [
                                // Corner decorations
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                        top: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                        top: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                        bottom: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                        bottom: BorderSide(
                                          color: currentPage.squareColor,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Accent dots
                                Positioned(
                                  top: 15,
                                  left: 40,
                                  child: Row(
                                    children: List.generate(
                                      3,
                                      (index) => Container(
                                        width: 6,
                                        height: 6,
                                        margin: EdgeInsets.only(right: 4),
                                        decoration: BoxDecoration(
                                          color: currentPage.accentColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
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
                                  final offset = value * -500;
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
                          final offset = value * -200;
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
                        final offset = value * -200;
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
          children: [
            // Floating icon - top left
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 40 + easedOffset,
              child: Opacity(
                opacity: (1.0 - value.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: content.squareColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    content.floatingIcons[0],
                    size: 32,
                    color: iconColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),

            // Floating icon - top right
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              right: 50 - easedOffset * 0.8,
              child: Opacity(
                opacity: (1.0 - value.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: content.squareColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    content.floatingIcons[1],
                    size: 40,
                    color: iconColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),

            // Floating icon - bottom left
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: 60 + easedOffset * 0.7,
              child: Opacity(
                opacity: (1.0 - value.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: content.squareColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    content.floatingIcons[2],
                    size: 36,
                    color: iconColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),

            // Floating icon - bottom right
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              right: 40 - easedOffset * 0.9,
              child: Opacity(
                opacity: (1.0 - value.abs()).clamp(0.0, 1.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: content.squareColor.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    content.floatingIcons[3],
                    size: 28,
                    color: iconColor.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ),
          ],
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

class OnboardingContent {
  final String title;
  final String description;
  final String centerIcon;
  final List<IconData> floatingIcons;
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
