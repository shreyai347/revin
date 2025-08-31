// features/home/widgets/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../../shared/providers/auth_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Dark background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(context),

              SizedBox(height: 24.h),

              // Quick Actions
              _buildQuickActions(context),

              SizedBox(height: 24.h),

              // Market Overview
              _buildMarketOverview(context),

              SizedBox(height: 24.h),

              // Featured Products
              _buildFeaturedProducts(context),

              SizedBox(height: 24.h),

              // Recent Activity
              _buildRecentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final userName =
            authProvider.user?.displayName ??
            authProvider.user?.email?.split('@')[0] ??
            'Farmer';

        return Container(
          padding: EdgeInsets.all(20.w),
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
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                            'Hi $userName! 👋',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          )
                          .animate()
                          .slideX(
                            begin: -0.3,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          )
                          .fadeIn(duration: 600.ms),

                      SizedBox(height: 6.h),

                      Text(
                            'Welcome to Revin',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          .animate(delay: 200.ms)
                          .slideX(
                            begin: -0.3,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          )
                          .fadeIn(duration: 600.ms),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 22.w,
                            ),
                          )
                          .animate(delay: 400.ms)
                          .scale(duration: 400.ms, curve: Curves.elasticOut)
                          .fadeIn(duration: 400.ms),

                      SizedBox(width: 12.w),

                      Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.chat_outlined,
                              color: Colors.white,
                              size: 22.w,
                            ),
                          )
                          .animate(delay: 600.ms)
                          .scale(duration: 400.ms, curve: Curves.elasticOut)
                          .fadeIn(duration: 400.ms),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                            horizontal: 18.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Colors.grey[600],
                                size: 22.w,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                'Search crops, prices...',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .animate(delay: 800.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 600.ms,
                        curve: Curves.easeOut,
                      )
                      .fadeIn(duration: 600.ms),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              'Quick Actions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            )
            .animate(delay: 1000.ms)
            .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
            .fadeIn(duration: 600.ms),

        SizedBox(height: 20.h),

        Row(
          children: [
            Expanded(
                  child: _buildActionCard(
                    context,
                    'Sell My Product',
                    Icons.sell_rounded,
                    const Color(0xFF2E7D32),
                    () {},
                  ),
                )
                .animate(delay: 1200.ms)
                .slideX(
                  begin: -0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),

            SizedBox(width: 16.w),

            Expanded(
                  child: _buildActionCard(
                    context,
                    'Market Prices',
                    Icons.trending_up_rounded,
                    const Color(0xFFFF9800),
                    () {},
                  ),
                )
                .animate(delay: 1400.ms)
                .slideX(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(icon, color: Colors.white, size: 28.w),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketOverview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                  'Market Prices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                )
                .animate(delay: 1600.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms),

            Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: const Color(0xFF4CAF50),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .animate(delay: 1800.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut)
                .fadeIn(duration: 400.ms),
          ],
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildPriceCard(
                    context,
                    'Rice Seed',
                    'Rs 55/Kg',
                    '+5.2%',
                    Colors.green,
                    'assets/rice.jpg',
                  )
                  .animate(delay: 2000.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms)
                  .scale(duration: 400.ms, curve: Curves.elasticOut),

              SizedBox(width: 16.w),

              _buildPriceCard(
                    context,
                    'Mango',
                    'Rs 40/Kg',
                    '-2.1%',
                    Colors.red,
                    'assets/mango.jpg',
                  )
                  .animate(delay: 2200.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms)
                  .scale(duration: 400.ms, curve: Curves.elasticOut),

              SizedBox(width: 16.w),

              _buildPriceCard(
                    context,
                    'Wheat Seeds',
                    'Rs 30/Kg',
                    '+1.8%',
                    Colors.green,
                    'assets/wheat.jpg',
                  )
                  .animate(delay: 2400.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms)
                  .scale(duration: 400.ms, curve: Curves.elasticOut),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceCard(
    BuildContext context,
    String product,
    String price,
    String change,
    Color changeColor,
    String imagePath,
  ) {
    return Container(
      width: 170.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[100],
                    child: Icon(
                      Icons.agriculture_rounded,
                      color: Colors.grey[400],
                      size: 45.w,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            product,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            price,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: changeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: changeColor.withOpacity(0.3), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  changeColor == Colors.green
                      ? Icons.trending_up
                      : Icons.trending_down,
                  color: changeColor,
                  size: 14.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  change,
                  style: TextStyle(
                    color: changeColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProducts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                  'Featured Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                )
                .animate(delay: 2600.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms),

            Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: const Color(0xFF4CAF50),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .animate(delay: 2800.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut)
                .fadeIn(duration: 400.ms),
          ],
        ),
        SizedBox(height: 20.h),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.75,
          children: [
            _buildProductCard(
                  context,
                  'Rice Seed',
                  'Rs 14/kg',
                  'assets/rice.jpg',
                )
                .animate(delay: 3000.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),

            _buildProductCard(
                  context,
                  'Lemon Tree',
                  'Rs 15/kg',
                  'assets/lemon.jpg',
                )
                .animate(delay: 3200.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),

            _buildProductCard(
                  context,
                  'Wheat Seed',
                  'Rs 12/kg',
                  'assets/wheat.jpg',
                )
                .animate(delay: 3400.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),

            _buildProductCard(
                  context,
                  'Cherry Tree',
                  'Rs 18/kg',
                  'assets/cherry.jpg',
                )
                .animate(delay: 3600.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: 600.ms)
                .scale(duration: 400.ms, curve: Curves.elasticOut),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String product,
    String price,
    String imagePath,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[100],
                      child: Icon(
                        Icons.agriculture_rounded,
                        color: Colors.grey[400],
                        size: 45.w,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            product,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            price,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              'Recent Activity',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            )
            .animate(delay: 3800.ms)
            .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
            .fadeIn(duration: 600.ms),

        SizedBox(height: 20.h),

        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
          ),
          child: Column(
            children: [
              _buildActivityItem(
                    context,
                    'Price Alert',
                    'Tomatoes price increased by 5.2%',
                    Icons.trending_up_rounded,
                    Colors.green,
                  )
                  .animate(delay: 4000.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms),

              SizedBox(height: 16.h),

              _buildActivityItem(
                    context,
                    'New Product',
                    'Wheat seeds added to your watchlist',
                    Icons.add_circle_rounded,
                    Colors.blue,
                  )
                  .animate(delay: 4200.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms),

              SizedBox(height: 16.h),

              _buildActivityItem(
                    context,
                    'Market Update',
                    'EU market prices updated',
                    Icons.update_rounded,
                    Colors.orange,
                  )
                  .animate(delay: 4400.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  )
                  .fadeIn(duration: 600.ms),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Icon(icon, color: color, size: 22.w),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
