import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';

import '../../../common/utils/ProjectColors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: context.theme.greyColor!.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    splashColor: Colors.transparent,
                    splashRadius: 22,
                    iconSize: 22,
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close_outlined),
                    color: ProjectColors.greyDark,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "App Language",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: context.theme.authAppbarTextColor
                        ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: context.theme.greyColor!.withOpacity(0.3),
                thickness: 0.5,
              ),

              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                activeColor: ProjectColors.greenDark,
                title: Text("English",style: TextStyle(color: context.theme.authAppbarTextColor)),
                subtitle: Text(
                  "(phone's language)",
                  style: TextStyle(
                    color: context.theme.greyColor
                  ),

                ),
              ),
              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) {},
                activeColor: ProjectColors.greenDark,
                title:  Text("Turkish",style: TextStyle(color: context.theme.authAppbarTextColor)),
                subtitle: Text(
                  "Türkiye",
                  style: TextStyle(
                    color: context.theme.greyColor
                  ),

                ),
              ),
              
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor, // const Color(0XFF182229),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory, //Tıklanınca splash yapmaması.
        highlightColor: context.theme
            .langBtnHighlightColor, // const Color(0XFF09141A), //Tıklandığı zaman görünmesini istediğimiz renk
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
