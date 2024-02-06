import 'package:flutter/material.dart';

import '../utils/ProjectColors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: ProjectColors.backgroundLight,
    scaffoldBackgroundColor: ProjectColors.backgroundLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.greenLight,
            foregroundColor: ProjectColors.backgroundLight,
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent),
      
    )
  );
}