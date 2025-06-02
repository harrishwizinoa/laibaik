import 'package:flutter/material.dart';

class AppColors {
  // Gradient 1 colors
  static const Color start = Color(0xFFC7102E); // #C7102E
  static const Color middle = Color(0xFFE62746); // #E62746
  static const Color end = Color(0xFFFF3152); // #FF3152

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [start, middle, end],
    stops: [0.1707, 0.6937, 1.0], // Normalized stops (105.01% clamped to 1.0)
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );


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