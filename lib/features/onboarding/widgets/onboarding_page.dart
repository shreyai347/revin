// features/onboarding/widgets/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../screens/onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Full background image
          Positioned.fill(
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        data.color.withOpacity(0.3),
                        data.color.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      _getIconForPage(data.title),
                      size: 120.w,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                );
              },
            ),
          ),

          // Dark overlay gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // Digital elements overlay
          Positioned(
            top: 100.h,
            right: 30.w,
            child:
                Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: data.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: data.color.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.analytics_rounded,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    )
                    .animate(delay: 600.ms)
                    .scale(duration: 400.ms, curve: Curves.elasticOut)
                    .fadeIn(duration: 400.ms),
          ),

          // Floating elements
          Positioned(
            top: 160.h,
            left: 20.w,
            child:
                Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: data.color,
                        shape: BoxShape.circle,
                      ),
                    )
                    .animate(delay: 800.ms)
                    .scale(duration: 300.ms, curve: Curves.elasticOut)
                    .fadeIn(duration: 300.ms),
          ),

          Positioned(
            top: 220.h,
            right: 60.w,
            child:
                Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                    )
                    .animate(delay: 1000.ms)
                    .scale(duration: 300.ms, curve: Curves.elasticOut)
                    .fadeIn(duration: 300.ms),
          ),

          // Content overlay
          Positioned(
            bottom: 120.h,
            left: 32.w,
            right: 32.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    )
                    .animate(delay: 200.ms)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: 600.ms,
                      curve: Curves.easeOut,
                    )
                    .fadeIn(duration: 600.ms),

                SizedBox(height: 20.h),

                // Description
                Text(
                      data.description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white.withOpacity(0.8),
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                    .animate(delay: 400.ms)
                    .slideY(
                      begin: 0.3,
                      end: 0,
                      duration: 600.ms,
                      curve: Curves.easeOut,
                    )
                    .fadeIn(duration: 600.ms),

                SizedBox(height: 40.h),

                // Digital agriculture tag
                Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: data.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: data.color.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.agriculture_rounded,
                            color: data.color,
                            size: 16.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Revin",
                            style: TextStyle(
                              color: data.color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate(delay: 600.ms)
                    .scale(duration: 400.ms, curve: Curves.elasticOut)
                    .fadeIn(duration: 400.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPage(String title) {
    switch (title) {
      case "Digital Agriculture":
        return Icons.agriculture_rounded;
      case "Market Intelligence":
        return Icons.analytics_rounded;
      case "Maximize Profits":
        return Icons.trending_up_rounded;
      default:
        return Icons.agriculture_rounded;
    }
  }
}
