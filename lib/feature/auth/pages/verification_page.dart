import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/feature/auth/widgets/custom_text_field.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });
  
  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'Verify your number',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTop: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                    children: [
                      const TextSpan(
                          text:
                              "You've tried to register +905425426742 before registering an SMS or call with your code.\n"),
                      TextSpan(
                          text: 'Wrong number?',
                          style: TextStyle(color: context.theme.blueColor))
                    ])),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: CustomTextField(
              hintText: '- - -   - - -',
              autoFocus: true,
              fontSize: 30,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 6) {
                  return verifySmsCode(context, ref, value);
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Enter 6-digit code',
            style: TextStyle(color: context.theme.greyColor),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Icon(
                Icons.message,
                color: context.theme.greyColor,
              ),
              const SizedBox(width: 20),
              Text(
                'Resend SMS',
                style: TextStyle(
                  color: context.theme.greyColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: context.theme.blueColor!.withOpacity(0.2),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: context.theme.greyColor,
              ),
              const SizedBox(width: 20),
              Text(
                'Call Me',
                style: TextStyle(
                  color: context.theme.greyColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ]),
      ),
    );
  }
}
