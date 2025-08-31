// features/monitoring/screens/monitoring_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['My Fields', 'Weather', 'Water', 'Schedule'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              _selectedTab == 0
                  ? 'assets/icons/farm.jpg'
                  : 'assets/icons/tree.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFF2E7D32));
              },
            ),
          ),

          // Dark overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(),

                SizedBox(height: 20.h),

                // Tab Navigation
                _buildTabNavigation(),

                SizedBox(height: 20.h),

                // Main Content
                Expanded(child: _buildMainContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _tabs[_selectedTab],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 20.w,
                ),
              ),
            ],
          ),
        )
        .animate()
        .slideY(begin: -0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildTabNavigation() {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Row(
            children: _tabs.asMap().entries.map((entry) {
              int index = entry.key;
              String tab = entry.value;
              bool isSelected = _selectedTab == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      tab,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                        fontSize: 14.sp,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
        .animate(delay: 200.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildMainContent() {
    switch (_selectedTab) {
      case 0:
        return _buildMyFieldsContent();
      case 1:
        return _buildWeatherContent();
      case 2:
        return _buildWaterContent();
      case 3:
        return _buildScheduleContent();
      default:
        return _buildMyFieldsContent();
    }
  }

  Widget _buildMyFieldsContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Map Controls
          _buildMapControls(),

          SizedBox(height: 20.h),

          // Weather Widget
          _buildWeatherWidget(),

          SizedBox(height: 16.h),

          // Water Widget
          _buildWaterWidget(),
        ],
      ),
    );
  }

  Widget _buildMapControls() {
    return Positioned(
          right: 20.w,
          top: 200.h,
          child: Row(
            children: [
              _buildControlButton(Icons.add_rounded),
              SizedBox(width: 8.w),
              _buildControlButton(Icons.remove_rounded),
              SizedBox(width: 8.w),
              _buildControlButton(Icons.straighten_rounded),
              SizedBox(width: 8.w),
              _buildControlButton(Icons.my_location_rounded),
            ],
          ),
        )
        .animate(delay: 400.ms)
        .slideX(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildControlButton(IconData icon) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 20.w),
    );
  }

  Widget _buildWeatherWidget() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wb_sunny_rounded,
                    color: Colors.orange,
                    size: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                '30°C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  _buildWeatherItem(Icons.cloud_rounded, 'Cloudy'),
                  SizedBox(width: 16.w),
                  _buildWeatherItem(Icons.air_rounded, 'Wind'),
                  SizedBox(width: 16.w),
                  _buildWeatherItem(Icons.water_drop_rounded, '68%'),
                ],
              ),
              SizedBox(height: 16.h),
              _buildTemperatureGraph(),
            ],
          ),
        )
        .animate(delay: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWeatherItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 16.w),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTemperatureGraph() {
    return Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTempBar('9 AM', 26, Colors.green),
          _buildTempBar('10 AM', 27, Colors.green),
          _buildTempBar('11 AM', 28, Colors.green),
          _buildTempBar('12 PM', 30, Colors.orange),
          _buildTempBar('1 PM', 31, Colors.orange),
          _buildTempBar('2 PM', 32, Colors.red),
          _buildTempBar('3 PM', 33, Colors.red),
        ],
      ),
    );
  }

  Widget _buildTempBar(String time, int temp, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 8.w,
          height: (temp - 20).h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          time,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildWaterWidget() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.water_drop_rounded,
                    color: Colors.blue,
                    size: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Water',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Dangerous level',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              _buildWaterLevelGraph(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '28.7%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      _buildActionButton('+ Watering', Colors.green),
                      SizedBox(width: 8.w),
                      _buildActionButton('+ Snooze', Colors.orange),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
        .animate(delay: 800.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWaterLevelGraph() {
    return Container(
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(10, (index) {
          double height = (index % 3 == 0) ? 8.h : 20.h + (index * 2).h;
          return Container(
            width: 6.w,
            height: height,
            decoration: BoxDecoration(
              color: height < 15.h ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(3.r),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.5), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildWeatherContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Current Weather Card
          _buildCurrentWeatherCard(),

          SizedBox(height: 16.h),

          // Hourly Forecast
          _buildHourlyForecast(),

          SizedBox(height: 16.h),

          // Weather Details
          _buildWeatherDetails(),
        ],
      ),
    );
  }

  Widget _buildCurrentWeatherCard() {
    return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Weather',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '30°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Feels like 32°C',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Icon(
                      Icons.wb_sunny_rounded,
                      color: Colors.orange,
                      size: 40.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildWeatherMetric(
                    Icons.water_drop_rounded,
                    'Humidity',
                    '68%',
                  ),
                  _buildWeatherMetric(Icons.air_rounded, 'Wind', '12 km/h'),
                  _buildWeatherMetric(
                    Icons.visibility_rounded,
                    'Visibility',
                    '10 km',
                  ),
                ],
              ),
            ],
          ),
        )
        .animate()
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWeatherMetric(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 24.w),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyForecast() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hourly Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 80.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final hours = [
                      'Now',
                      '1PM',
                      '2PM',
                      '3PM',
                      '4PM',
                      '5PM',
                      '6PM',
                      '7PM',
                    ];
                    final temps = [30, 31, 32, 33, 32, 31, 29, 27];
                    final icons = [
                      Icons.wb_sunny_rounded,
                      Icons.wb_sunny_rounded,
                      Icons.wb_cloudy_rounded,
                      Icons.wb_cloudy_rounded,
                      Icons.wb_cloudy_rounded,
                      Icons.wb_cloudy_rounded,
                      Icons.wb_cloudy_rounded,
                      Icons.wb_cloudy_rounded,
                    ];

                    return Container(
                      width: 60.w,
                      margin: EdgeInsets.only(right: 12.w),
                      child: Column(
                        children: [
                          Text(
                            hours[index],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Icon(icons[index], color: Colors.orange, size: 20.w),
                          SizedBox(height: 4.h),
                          Text(
                            '${temps[index]}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
        .animate(delay: 200.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWeatherDetails() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            children: [
              _buildDetailRow('UV Index', '7', 'High', Colors.orange),
              SizedBox(height: 12.h),
              _buildDetailRow('Pressure', '1013 hPa', 'Normal', Colors.blue),
              SizedBox(height: 12.h),
              _buildDetailRow('Dew Point', '22°C', 'Comfortable', Colors.green),
            ],
          ),
        )
        .animate(delay: 400.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildDetailRow(
    String label,
    String value,
    String status,
    Color color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14.sp,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: color,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWaterContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Water Level Overview
          _buildWaterLevelOverview(),

          SizedBox(height: 16.h),

          // Water Sources
          _buildWaterSources(),

          SizedBox(height: 16.h),

          // Watering Schedule
          _buildWateringSchedule(),
        ],
      ),
    );
  }

  Widget _buildWaterLevelOverview() {
    return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Water Level',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '28.7%',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dangerous Level',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                      size: 40.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildWaterLevelChart(),
            ],
          ),
        )
        .animate()
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWaterLevelChart() {
    return Container(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          final heights = [15, 25, 35, 20, 10, 5, 8];
          final colors = [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.orange,
            Colors.red,
            Colors.red,
            Colors.red,
          ];

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 12.w,
                height: heights[index].h,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10.sp,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildWaterSources() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Water Sources',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              _buildWaterSourceItem('Main Tank', '45%', Colors.blue),
              SizedBox(height: 12.h),
              _buildWaterSourceItem('Backup Tank', '12%', Colors.red),
              SizedBox(height: 12.h),
              _buildWaterSourceItem('Well', '78%', Colors.green),
            ],
          ),
        )
        .animate(delay: 200.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildWaterSourceItem(String name, String level, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: 12.w),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          level,
          style: TextStyle(
            color: color,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildWateringSchedule() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Watering Schedule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              _buildScheduleItem(
                'Field A',
                '6:00 AM',
                'Completed',
                Colors.green,
              ),
              SizedBox(height: 12.h),
              _buildScheduleItem(
                'Field B',
                '8:00 AM',
                'In Progress',
                Colors.orange,
              ),
              SizedBox(height: 12.h),
              _buildScheduleItem('Field C', '10:00 AM', 'Pending', Colors.grey),
            ],
          ),
        )
        .animate(delay: 400.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildScheduleItem(
    String field,
    String time,
    String status,
    Color color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Today's Schedule
          _buildTodaysSchedule(),

          SizedBox(height: 16.h),

          // Crop Calendar
          _buildCropCalendar(),

          SizedBox(height: 16.h),

          // Tasks
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildTodaysSchedule() {
    return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.white,
                    size: 24.w,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Today\'s Schedule',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              _buildScheduleTask(
                '6:00 AM',
                'Watering Field A',
                'Completed',
                Colors.green,
              ),
              SizedBox(height: 12.h),
              _buildScheduleTask(
                '8:00 AM',
                'Fertilizer Application',
                'In Progress',
                Colors.orange,
              ),
              SizedBox(height: 12.h),
              _buildScheduleTask(
                '10:00 AM',
                'Soil Testing',
                'Pending',
                Colors.blue,
              ),
              SizedBox(height: 12.h),
              _buildScheduleTask(
                '2:00 PM',
                'Harvest Planning',
                'Pending',
                Colors.purple,
              ),
            ],
          ),
        )
        .animate()
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildScheduleTask(
    String time,
    String task,
    String status,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  task,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCropCalendar() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crop Calendar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCropPhase('Planting', 'Mar 15', Colors.green),
                  _buildCropPhase('Growing', 'Apr 20', Colors.blue),
                  _buildCropPhase('Harvest', 'Jul 10', Colors.orange),
                ],
              ),
            ],
          ),
        )
        .animate(delay: 200.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildCropPhase(String phase, String date, Color color) {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Icon(Icons.agriculture_rounded, color: color, size: 20.w),
        ),
        SizedBox(height: 8.h),
        Text(
          phase,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          date,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTasksList() {
    return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              _buildTaskItem('Pest Control', 'Tomorrow', Colors.red),
              SizedBox(height: 12.h),
              _buildTaskItem('Irrigation Check', 'Day After', Colors.blue),
              SizedBox(height: 12.h),
              _buildTaskItem(
                'Equipment Maintenance',
                'Next Week',
                Colors.orange,
              ),
            ],
          ),
        )
        .animate(delay: 400.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut)
        .fadeIn(duration: 600.ms);
  }

  Widget _buildTaskItem(String task, String dueDate, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: 12.w),
            Text(
              task,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          dueDate,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
