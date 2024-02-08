import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/ProjectColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTop,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final Widget? prefixText;
  final VoidCallback? onTop;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: readOnly == null ? keyboardType : null,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      onTap: onTop,
      style: TextStyle(color: context.theme.authAppbarTextColor),
      textAlign: textAlign ?? TextAlign.center,
      decoration: InputDecoration(
          isDense: true,
          suffix: suffixIcon,
          prefix: prefixText,
          hintText: hintText,
          hintStyle: TextStyle(color: context.theme.greyColor),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.greenDark)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.greenDark,width: 2))),
    );
  }
}
