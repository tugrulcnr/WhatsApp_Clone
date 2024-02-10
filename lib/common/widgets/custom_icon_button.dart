import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTop;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;

  const CustomIconButton({
    super.key,
    required this.onTop,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth, 
    this.background, 
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border
      ),
      child: IconButton(
        onPressed: onTop,
        splashColor: Colors.transparent,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: iconColor ?? context.theme.greyColor,
        ),
      ),
    );
  }
}
