
import 'package:flutter/material.dart';

import '../../../common/utils/ProjectColors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0XFF182229),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        splashFactory:
            NoSplash.splashFactory, //Tıklanınca splash yapmaması.
        highlightColor: const Color(
            0XFF09141A), //Tıklandığı zaman görünmesini istediğimiz renk
        child: const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                color: ProjectColors.greenDark,
              ),
              SizedBox(
                width: 10,
              ),
              Text('English',
                  style: TextStyle(
                    color: ProjectColors.greenDark,
                  )),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: ProjectColors.greenDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}
