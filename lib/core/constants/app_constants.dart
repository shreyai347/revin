// core/constants/app_constants.dart
class AppConstants {
  // App Information
  static const String appName = 'Revin';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Smart Market Analysis for Farmers';

  // API Constants
  static const String baseUrl = 'https://api.europa.eu/agri/fruitAndVegetable';
  static const String apiKey = ''; // Add your API key if required

  // Storage Keys
  static const String isFirstTimeKey = 'is_first_time';
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';

  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration pageTransitionDuration = Duration(milliseconds: 300);

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultElevation = 4.0;

  // Colors
  static const int primaryColorValue = 0xFF2E7D32; // Deep Green
  static const int secondaryColorValue = 0xFFFF9800; // Orange
  static const int accentColorValue = 0xFF2196F3; // Blue
}
