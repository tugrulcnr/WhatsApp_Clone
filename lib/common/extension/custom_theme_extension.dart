import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/ProjectColors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
      circleImageColor: Color(0xFF25D366),
      greyColor: ProjectColors.greyLight,
      blueColor: ProjectColors.blueLight,
      langBtnBgColor: Color(0xFFF7F8FA),
      langBtnHighlightColor: Color(0xFFE8E8ED), 
      authAppbarTextColor: ProjectColors.greyLight);

  static const darkMode = CustomThemeExtension(
      circleImageColor: ProjectColors.greenDark,
      greyColor: ProjectColors.greyDark,
      blueColor: ProjectColors.blueDark,
      langBtnBgColor: Color(0xFF182229),
      langBtnHighlightColor: Color(0xFF09141A), 
      authAppbarTextColor: Color(0xFFE9EDEF));

  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;

  const CustomThemeExtension({
    required this.circleImageColor,
    required this.greyColor,
    required this.blueColor,
    required this.langBtnBgColor,
    required this.langBtnHighlightColor,
    required this.authAppbarTextColor,
  });

  @override
  ThemeExtension<CustomThemeExtension> copyWith(
    {Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppbarTextColor,
    }
  ) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor, 
      greyColor: greyColor ?? this.greyColor, 
      blueColor: blueColor ?? this.blueColor, 
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor, 
      langBtnHighlightColor: langBtnHighlightColor ?? this.langBtnHighlightColor, 
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this; 
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t), 
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t), 
      langBtnHighlightColor: Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t), 
      authAppbarTextColor: Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      );
  }
}