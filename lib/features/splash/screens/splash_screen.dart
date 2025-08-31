// features/splash/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_constants.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../onboarding/screens/onboarding_screen.dart';
import '../../home/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Initialize auth provider
    context.read<AuthProvider>().init();

    // Wait for splash duration
    await Future.delayed(AppConstants.splashDuration);

    // Navigate based on auth state
    if (mounted) {
      final authProvider = context.read<AuthProvider>();
      if (authProvider.isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Animated floating elements
              Positioned(
                top: 100.h,
                left: 30.w,
                child: _buildFloatingCircle(
                  40.w,
                  Colors.green.withOpacity(0.2),
                ),
              ),
              Positioned(
                bottom: 150.h,
                right: 40.w,
                child: _buildFloatingCircle(
                  30.w,
                  Colors.white.withOpacity(0.15),
                ),
              ),
              Positioned(
                top: 250.h,
                right: 50.w,
                child: _buildFloatingCircle(
                  25.w,
                  Colors.lightGreen.withOpacity(0.2),
                ),
              ),
              Positioned(
                bottom: 250.h,
                left: 60.w,
                child: _buildFloatingCircle(
                  35.w,
                  Colors.white.withOpacity(0.1),
                ),
              ),

              // Main Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo with creative design
                    Container(
                          width: 180.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                            // Removed background color and shadows
                          ),
                          child: Stack(
                            children: [
                              // Logo content
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Logo icon with enhanced styling
                                    Container(
                                      width: 90.w,
                                      height: 90.w,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF2E7D32),
                                            const Color(0xFF4CAF50),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          25.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF2E7D32,
                                            ).withOpacity(0.4),
                                            blurRadius: 20,
                                            offset: const Offset(0, 8),
                                          ),
                                          BoxShadow(
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                            blurRadius: 10,
                                            offset: const Offset(0, -4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.agriculture_rounded,
                                        color: Colors.white,
                                        size: 48.w,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    // App name with enhanced styling
                                    Text(
                                      "Revin",
                                      style: TextStyle(
                                        color: const Color(0xFF2E7D32),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 32.sp,
                                        letterSpacing: 1.8,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white.withOpacity(
                                              0.8,
                                            ),
                                            blurRadius: 10,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .scale(
                          duration: 1200.ms,
                          curve: Curves.elasticOut,
                          begin: const Offset(0.3, 0.3),
                          end: const Offset(1.0, 1.0),
                        )
                        .fadeIn(duration: 1000.ms)
                        .then()
                        .shake(
                          duration: 600.ms,
                          hz: 4,
                          curve: Curves.easeInOut,
                        ),

                    SizedBox(height: 30.h),

                    // Tagline with attractive styling
                    Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Text(
                            "Transforming Agriculture, Together",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              height: 1.4,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                        .animate(delay: 600.ms)
                        .slideY(
                          begin: 0.5,
                          end: 0,
                          duration: 1000.ms,
                          curve: Curves.easeOut,
                        )
                        .fadeIn(duration: 1000.ms),
                  ],
                ),
              ),

              // Subtle animated particles in background
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    child: CustomPaint(painter: _ParticlePainter()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingCircle(double size, Color color) {
    return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(
          duration: 3000.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.3, 1.3),
        )
        .fade(duration: 3000.ms, begin: 1.0, end: 0.5)
        .move(duration: 4000.ms, begin: Offset.zero, end: const Offset(0, -20));
  }
}

class _ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Draw floating particles
    for (int i = 0; i < 20; i++) {
      final x = (i * 100.0) % size.width;
      final y = (i * 70.0) % size.height;
      final radius = 3.0 + (i % 3) * 2.0;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
