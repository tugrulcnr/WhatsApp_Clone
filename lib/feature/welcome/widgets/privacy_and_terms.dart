import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/ProjectColors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(
          text: 'Read our ',
          style: TextStyle(
            color: context.theme.greyColor,    // ProjectColors.greyDark,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: 'Privacy Policy. ',
              style: TextStyle(
                color: context.theme.blueColor    // ProjectColors.blueDark,
              ),
            ),
            const TextSpan(text: 'Tap "Agree and continue" to accept the '),
            TextSpan(
              text: 'Terms of Services.',
              style: TextStyle(
                color: context.theme.blueColor // ProjectColors.blueDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}