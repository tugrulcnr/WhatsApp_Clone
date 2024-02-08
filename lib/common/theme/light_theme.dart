import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extension/custom_theme_extension.dart';
import '../utils/ProjectColors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: ProjectColors.backgroundLight,
    scaffoldBackgroundColor: ProjectColors.backgroundLight,
    extensions:[
      CustomThemeExtension.lightMode,
    ],
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark

      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.greenLight,
            foregroundColor: ProjectColors.backgroundLight,
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ProjectColors.backgroundLight,
      modalBackgroundColor: ProjectColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )

      )
    )
  );
}