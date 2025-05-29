import 'package:flutter/material.dart';

import '../apiservice.dart';

// Utility to convert hex string to Color
Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');

  // Remove "0x" if it's already present
  if (hex.startsWith('0x')) {
    hex = hex.substring(2);
  }
  if (hex.length == 6) {
    hex = 'FF$hex'; // Add full opacity
  }
  return Color(int.parse('0x$hex'));
}

// Color manager class
class AppColors {
  String color_1 = "";
  String color_2 = "";
  String color_3 = "";

  late Color gradientStart;
  late Color gradientMiddle;
  late Color gradientEnd;

  late LinearGradient primaryGradient;

  Future<void> assignColor() async {
    final colors = await ApiService().fetchData();
    color_1 = colors['gradientStart'];
    color_2 = colors['gradientMiddle'];
    color_3 = colors['gradientEnd'];

    gradientStart = hexToColor(color_1);
    gradientMiddle = hexToColor(color_2);
    gradientEnd = hexToColor(color_3);

    primaryGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.1707, 0.6937, 1.0501],
      colors: [gradientStart, gradientMiddle, gradientEnd],
    );
  }

  // Static fallback colors
  static const Color primary = Color(0xFF6200EE);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.grey;
}


class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading,
      headlineMedium: AppTextStyles.subHeading,
      headlineSmall: AppTextStyles.body,
    ),
  );
}
