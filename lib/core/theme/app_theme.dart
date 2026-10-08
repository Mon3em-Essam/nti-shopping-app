import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.offWhite,

      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.charcoal,
        titleTextStyle: TextStyle(
          color: AppColors.charcoal,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.defaultHintTextColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.orangeLight, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.defaultBorderColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.white, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.errorBorderColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.errorBorderColor,
            width: 2,
          ),
        ),
      ),
      textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(
        color: AppColors.white,
          fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      bodyLarge: GoogleFonts.inter(
        color: AppColors.primaryColorBlack,
          fontSize: 22,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: GoogleFonts.inter(
          fontSize: 18,
        color: AppColors.primaryColorBlack,
        fontWeight: FontWeight.w400,
      ),

      labelMedium: GoogleFonts.inter(
          fontSize: 14,
        color: AppColors.primaryColorBlack,
        fontWeight: FontWeight.w400,
      ),

        labelLarge: GoogleFonts.inter(
          fontSize: 20,
          color: AppColors.primaryColorBlack,
          fontWeight: FontWeight.w500,
        ),
      ),

bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.orangeLight,
        unselectedItemColor: AppColors.defaultHintTextColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        selectedIconTheme: const IconThemeData(size: 24),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
