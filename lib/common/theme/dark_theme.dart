import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/ProjectColors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: ProjectColors.backgroundDark,
    scaffoldBackgroundColor: ProjectColors.backgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.greenDark,
            foregroundColor: ProjectColors.backgroundDark,
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent),
      
    )
  );
}