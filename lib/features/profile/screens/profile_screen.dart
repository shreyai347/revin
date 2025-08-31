// features/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../shared/providers/auth_provider.dart';
import '../../auth/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: _buildAppBar(),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // Enhanced Profile Header
                _buildProfileHeader(context, authProvider),

                SizedBox(height: 24.h),

                // Quick Stats
                _buildQuickStats(),

                SizedBox(height: 24.h),

                // Menu Items with enhanced design
                _buildMenuSection(context),

                SizedBox(height: 24.h),

                // FAQ Section
                _buildFAQSection(context),

                SizedBox(height: 24.h),

                // Sign Out Button
                _buildSignOutButton(context, authProvider),

                SizedBox(height: 32.h),
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF2E7D32),
      elevation: 0,
      title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16.w),
          child: IconButton(
            icon: Icon(Icons.settings_rounded, color: Colors.white, size: 24.w),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context, AuthProvider authProvider) {
    return Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2E7D32),
                const Color(0xFF4CAF50),
                const Color(0xFF66BB6A),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2E7D32).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              // Profile Avatar with enhanced design
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 50.w,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 16.h),

              // User Name
              Text(
                authProvider.user?.displayName ?? 'Farmer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),

              SizedBox(height: 8.h),

              // Email
              Text(
                authProvider.user?.email ?? 'farmer@revin.com',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 16.h),

              // Member Since Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: Colors.white,
                      size: 16.w,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Premium Member',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .slideY(begin: -0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildQuickStats() {
    return Row(
          children: [
            Expanded(
              child: _buildStatCard('Crops', '12', Icons.agriculture_rounded),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard('Alerts', '5', Icons.notifications_rounded),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard('Analysis', '8', Icons.analytics_rounded),
            ),
          ],
        )
        .animate(delay: 200.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: const Color(0xFF2E7D32), size: 20.w),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            _buildEnhancedMenuItem(
              context,
              'My Crops',
              Icons.agriculture_rounded,
              () {},
            ),
            _buildEnhancedMenuItem(
              context,
              'Price Alerts',
              Icons.notifications_rounded,
              () {},
            ),
            _buildEnhancedMenuItem(
              context,
              'Market Analysis',
              Icons.analytics_rounded,
              () {},
            ),
            _buildEnhancedMenuItem(
              context,
              'Settings',
              Icons.settings_rounded,
              () {},
            ),
          ],
        )
        .animate(delay: 400.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildEnhancedMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        leading: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2E7D32).withOpacity(0.1),
                const Color(0xFF4CAF50).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: const Color(0xFF2E7D32), size: 22.w),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.w,
            color: Colors.grey[600],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildFAQSection(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            _buildFAQItem(
              'How do I set up price alerts?',
              'Go to Price Alerts section and select your crops. Set your desired price thresholds and you\'ll receive notifications when prices change.',
            ),
            _buildFAQItem(
              'What crops are supported?',
              'We support all major agricultural crops including rice, wheat, corn, vegetables, and fruits with real-time market data.',
            ),
            _buildFAQItem(
              'How accurate is the market analysis?',
              'Our analysis uses real-time data from multiple sources and advanced algorithms to provide 95%+ accuracy in price predictions.',
            ),
            _buildFAQItem(
              'Can I track multiple farms?',
              'Yes! You can add multiple farm locations and track different crops for each location separately.',
            ),
          ],
        )
        .animate(delay: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        childrenPadding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.help_outline_rounded,
            color: const Color(0xFF2E7D32),
            size: 18.w,
          ),
        ),
        title: Text(
          question,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Text(
            answer,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context, AuthProvider authProvider) {
    return Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red[400]!, Colors.red[600]!],
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () async {
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_rounded, color: Colors.white, size: 20.w),
                SizedBox(width: 8.w),
                Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        .animate(delay: 800.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }
}
