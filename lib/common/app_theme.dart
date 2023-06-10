import 'package:event_app/common/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: const UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Palette.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Palette.primary,
      ),
    ),
    alignLabelWithHint: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Palette.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Palette.red,
      ),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  );

  static ThemeData light(Color? primary, TextTheme? textTheme) {
    final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      useMaterial3: false,
      cardColor: Colors.white,
      textTheme: textTheme,
      hintColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
        foregroundColor: Color(0xFF1B1B1E),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.grey,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: inputDecorationTheme,
      cardTheme: CardTheme(
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.4),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Palette.primary,
          ),
          minimumSize: const Size(
            double.infinity,
            50,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Palette.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Palette.primary,
          ),
          backgroundColor: Colors.white,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        disabledColor: Colors.pink,
        splashColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(thickness: 1),
      listTileTheme: const ListTileThemeData(
        horizontalTitleGap: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
      ).copyWith(background: Colors.white),
    );

    return lightTheme;
  }
}
