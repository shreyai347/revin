// features/onboarding/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_constants.dart';
import '../widgets/onboarding_page.dart';
import '../../auth/screens/login_screen.dart';

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Digital Agriculture",
      description:
          "Smart farming solutions powered by AI and real-time market data for modern farmers.",
      imagePath: "assets/1.jpg",
      color: const Color(0xFF2E7D32),
    ),
    OnboardingData(
      title: "Market Intelligence",
      description:
          "Track price trends, analyze market patterns, and make data-driven decisions for your farm.",
      imagePath: "assets/2.jpg",
      color: const Color(0xFFFF9800),
    ),
    OnboardingData(
      title: "Maximize Profits",
      description:
          "Optimize your crop planning, set smart alerts, and discover the best markets worldwide.",
      imagePath: "assets/3.jpg",
      color: const Color(0xFF2196F3),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.pageTransitionDuration,
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Page View
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(data: _onboardingData[index]);
              },
            ),

            // Skip Button
            Positioned(
              top: 20.h,
              right: 20.w,
              child: TextButton(
                onPressed: _navigateToLogin,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Bottom Section - Circular progress indicator with arrow button
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Center(
                child:
                    GestureDetector(
                          onTap: _nextPage,
                          child: SizedBox(
                            width: 60.w,
                            height: 60.w,
                            child: Stack(
                              children: [
                                // Background circle
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 2,
                                    ),
                                  ),
                                ),
                                // Progress circle
                                SizedBox(
                                  width: 60.w,
                                  height: 60.w,
                                  child: CircularProgressIndicator(
                                    value:
                                        (_currentPage + 1) /
                                        _onboardingData.length,
                                    strokeWidth: 3,
                                    backgroundColor: Colors.transparent,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      _onboardingData[_currentPage].color,
                                    ),
                                  ),
                                ),
                                // Center arrow button
                                Center(
                                  child: Container(
                                    width: 36.w,
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                      color:
                                          _onboardingData[_currentPage].color,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: _onboardingData[_currentPage]
                                              .color
                                              .withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 18.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .animate(delay: 200.ms)
                        .scale(duration: 400.ms, curve: Curves.elasticOut)
                        .fadeIn(duration: 400.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
