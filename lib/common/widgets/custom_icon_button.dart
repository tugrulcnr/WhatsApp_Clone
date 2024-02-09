import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTop;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  const CustomIconButton({
    super.key,
    required this.onTop,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTop,
      splashColor: Colors.transparent,
      splashRadius: 22,
      iconSize: iconSize ?? 22,
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: iconColor ?? context.theme.greyColor,
      ),
    );
  }
}
