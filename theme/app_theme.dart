import 'package:flutter/material.dart';

class AppTheme {
  // === CORES BASE === //
  static const Color _primaryColor = Color(0xFFA3B858); // Verde oliva claro
  static const Color _secondaryColor = Color(0xFFC8D29B); // Verde pálido
  static const Color _backgroundLight = Color(
    0xFFECEEDB,
  ); // Fundo claro bege-esverdeado
  static const Color _surfaceLight = Color(0xFFDDE4B7); // Cartões claros
  static const Color _textDark = Color(0xFF3E3E3E); // Texto escuro
  static const Color _accentColor = Color(0xFF7B8D42); // Verde oliva forte

  // === CORES DARK === //
  static const Color _backgroundDark = Color(0xFF1C1D14); // Fundo escuro oliva
  static const Color _surfaceDark = Color(0xFF2C2E1D); // Cartões escuros
  static const Color _textLight = Color(0xFFE8EAD9); // Texto claro
  static const Color _surfaceDark2 = Color.fromARGB(
    255,
    86,
    92,
    50,
  ); // Cartões escuros

  // === TEMA CLARO === //
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _backgroundLight,
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        surface: _surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: _textDark,
        onPrimaryFixedVariant: _surfaceDark2,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surfaceLight,
        hintStyle: TextStyle(color: Colors.grey[700]),
        prefixIconColor: _accentColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: _textDark, fontSize: 16),
        bodyMedium: TextStyle(color: _textDark, fontSize: 14),
        titleLarge: TextStyle(
          color: _accentColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: _accentColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardTheme(
        color: _surfaceLight,
        elevation: 0,
        margin: const EdgeInsets.all(6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      iconTheme: const IconThemeData(color: _accentColor),
    );
  }

  // === TEMA ESCURO === //
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _backgroundDark,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
        surface: _surfaceDark,
        onPrimary: Colors.white,
        onSecondary: _textLight,
        onSurface: _textLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _surfaceDark,
        foregroundColor: _textLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _textLight,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surfaceDark,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIconColor: _primaryColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: _textLight, fontSize: 16),
        bodyMedium: TextStyle(color: _textLight, fontSize: 14),
        titleLarge: TextStyle(
          color: _primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: _primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardTheme(
        color: _surfaceDark,
        elevation: 1,
        margin: const EdgeInsets.all(6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _surfaceDark,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      iconTheme: const IconThemeData(color: _primaryColor),
    );
  }
}
