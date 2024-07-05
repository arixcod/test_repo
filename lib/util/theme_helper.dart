import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/util/pref_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 4,
        space: 4,
        color: appTheme.whiteA700,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 10.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 10.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 8.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 15.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF080E1E),
    primaryContainer: Color(0XFF393636),
    secondaryContainer: Color(0XFFFFB700),
    onErrorContainer: Color(0XFFB3B3B3),
    onPrimary: Color(0XFFFF4A4A),
    onPrimaryContainer: Color(0XFF000034),
    onSecondaryContainer: Color(0XFF610083),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amber700 => Color(0XFFE0A100);
// Black
  Color get black900 => Color(0XFF000000);
// BlackCc
  Color get black900Cc => Color(0XCC080D1B);
// Blue
  Color get blue400 => Color(0XFF4E9AF4);
// BlueGray
  Color get blueGray100 => Color(0XFFD1D1D1);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF363636);
// Cyan
  Color get cyanA200 => Color(0XFF30FFD9);
// Gray
  Color get gray100 => Color(0XFFF7F6F0);
  Color get gray10001 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFEFEEEE);
  Color get gray700 => Color(0XFF64646E);
// Green
  Color get green800 => Color(0XFF00A810);
// LightGreen
  Color get lightGreen50 => Color(0XFFF5F3EA);
// Pink
  Color get pink900 => Color(0XFF81005A);
// Red
  Color get red400 => Color(0XFFF44E4E);
  Color get red900 => Color(0XFFA70000);
// Teal
  Color get teal300 => Color(0XFF4AB19E);
  Color get tealA700 => Color(0XFF00C2AF);
// White
  Color get whiteA700 => Color(0XFFFFFFFF);
// Yellow
  Color get yellow500 => Color(0XFFFFEA30);
  Color get yellowA700 => Color(0XFFFFD600);
}
