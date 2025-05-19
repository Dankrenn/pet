import 'package:flutter/material.dart';


class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6200EE),       // Основной фиолетовый
      primaryContainer: Color(0xFF3700B3), // Темный фиолетовый
      secondary: Color(0xFF03DAC6),     // Акцентный бирюзовый
      secondaryContainer: Color(0xFF018786), // Темный бирюзовый
      surface: Color(0xFFFFFFFF),       // Фон поверхностей
      error: Color(0xFFCF6679),         // Ошибка
      onPrimary: Color(0xFFFFFFFF),  // Текст на primary
      onSecondary: Color(0xFF000000),   // Текст на secondary
      onSurface: Color(0xFF555454),     // Основной текст
      onError: Color(0xFF000000),       // Текст на error
    ),
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC),       // Светлый фиолетовый
      primaryContainer: Color(0xFF3700B3), // Темный фиолетовый
      secondary: Color(0xFF25DCB0),     // Акцентный бирюзовый
      secondaryContainer: Color(0xFF03DAC6), // Светлый бирюзовый
      surface: Color(0xFF121212),       // Фон поверхностей
      error: Color(0xFFCF6679),         // Ошибка
      onPrimary: Color(0xFFFFFFFF),  // Текст на primary
      onSecondary: Color(0xFF000000),   // Текст на secondary
      onSurface: Color(0xFFBCB9B9),     // Основной текст
      onError: Color(0xFF000000),       // Текст на error
      background: Color(0xFF121212),    // Фон приложения
    ),
    brightness: Brightness.dark,
  );
}