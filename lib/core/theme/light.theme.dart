import 'package:flutter/material.dart';

// User defined colors
const primaryColor = Color(0xFF1B4F72); // Deep Blue
const secondaryColor = Color(0xFF28B463); // Green
const errorColor = Color(0xFFE74C3C); // Red
const warningColor = Color(0xFFF39C12); // Orange
const backgroundColor = Color(0xFFF8F9FA); // Light Gray
const cardBackgroundColor = Color(0xFFFFFFFF); // White
const textPrimaryColor = Color(0xFF2C3E50); // Dark Gray
const textSecondaryColor = Color(0xFF7F8C8D); // Medium Gray
const borderColor = Color(0xFFE0E0E0); // Light Gray
const successColor = Color(0xFF27AE60); // Green

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: Colors.white,
  secondary: secondaryColor,
  onSecondary: Colors.white,
  tertiary: warningColor, // Using Warning as Tertiary
  onTertiary: Colors.white,
  error: errorColor,
  onError: Colors.white,
  surface: cardBackgroundColor,
  onSurface: textPrimaryColor,
  surfaceContainer: backgroundColor, // New Material 3 role for background
  onSurfaceVariant: textSecondaryColor,
  outline: borderColor,
);
