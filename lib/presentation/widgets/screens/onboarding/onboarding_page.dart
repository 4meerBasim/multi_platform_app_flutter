import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_platform_media_player/core/routes/route_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

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

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      title: 'Discover Your Media',
      description:
          'Explore a world of entertainment with our multi-platform media player',
      icon: Icons.explore,
      color: Color(0xFF1A1A2E),
      gradient: [Color(0xFF0F0F1E), Color(0xFF1A1A2E)],
    ),
    OnboardingContent(
      title: 'Seamless Playback',
      description:
          'Enjoy smooth playback across all your devices with synchronized progress',
      icon: Icons.play_circle_filled,
      color: Color(0xFF16213E),
      gradient: [Color(0xFF0F1624), Color(0xFF16213E)],
    ),
    OnboardingContent(
      title: 'Your Library, Everywhere',
      description:
          'Access your entire media collection from anywhere, on any device',
      icon: Icons.video_library,
      color: Color(0xFF1F1F3A),
      gradient: [Color(0xFF15152A), Color(0xFF1F1F3A)],
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    _exitController.dispose();
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

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() async {
    // Smooth exit animation
    await _exitController.animateTo(
      0.0,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    if (mounted) {
      context.go(AppRoutes.responsiveLandingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            // Animated background gradient
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _pages[_currentPage].gradient,
                ),
              ),
            ),

            // Floating circles animation
            ..._buildFloatingCircles(),

            SafeArea(
              child: Column(
                children: [
                  // Skip button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        onPressed: _finishOnboarding,
                        child: Text(
                          'Skip',
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: _pages.length,
                      itemBuilder: (context, index) {
                        return _buildPage(_pages[index]);
                      },
                    ),
                  ),

                  // Page indicators
                  _buildPageIndicators(),

                  SizedBox(height: 20),

                  // Navigation buttons
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button
                        AnimatedOpacity(
                          opacity: _currentPage > 0 ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 200),
                          child: IconButton(
                            onPressed: _currentPage > 0 ? _previousPage : null,
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),

                        // Next/Get Started button
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: _pages[_currentPage].color,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingContent content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated icon
          ScaleTransition(
            scale: CurvedAnimation(
              parent: _scaleController,
              curve: Curves.elasticOut,
            ),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(content.icon, size: 120, color: Colors.white),
            ),
          ),

          SizedBox(height: 60),

          // Animated title
          SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: _slideController,
                    curve: Curves.easeOut,
                  ),
                ),
            child: FadeTransition(
              opacity: _fadeController,
              child: Text(
                content.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Animated description
          SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: _slideController,
                    curve: Curves.easeOut,
                  ),
                ),
            child: FadeTransition(
              opacity: _fadeController,
              child: Text(
                content.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 18,
                  color: Colors.white.withValues(alpha: 0.9),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 30 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Colors.white
                : Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingCircles() {
    return List.generate(
      5,
      (index) => TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(milliseconds: 2000 + (index * 500)),
        curve: Curves.easeInOut,
        onEnd: () {
          // This will cause the animation to rebuild and restart
          if (mounted) {
            setState(() {});
          }
        },
        builder: (context, value, child) {
          return Positioned(
            top: 100 + (index * 150.0) + (math.sin(value * math.pi * 2) * 30),
            left: 30 + (index * 70.0) + (math.cos(value * math.pi * 2) * 40),
            child: Opacity(
              opacity: 0.1,
              child: Container(
                width: 80 + (index * 20.0),
                height: 80 + (index * 20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<Color> gradient;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.gradient,
  });
}
