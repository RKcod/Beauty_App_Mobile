import 'package:beauty_app_mobile/features/auth/views/forgot_password_view.dart';
import 'package:beauty_app_mobile/features/auth/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class ForgotPasswordChooseView extends StatelessWidget {
  const ForgotPasswordChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    List<(String, IconData, VoidCallback)> forgotMethods = [
      (
        "Via email",
        Iconsax.sms_outline,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ForgotPasswordView()),
          );
        },
      ),
      (
        "Via sms",
        Iconsax.mobile_outline,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ResetPasswordView()),
          );
        },
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Text(
              "Forgot password",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text(
              "Select which contact details should we use to reset your password:",
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(32),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children:
                  forgotMethods
                      .map(
                        (item) => GestureDetector(
                          onTap: item.$3,
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1EEEE),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(item.$2),
                                Gap(15),
                                Text(
                                  item.$1,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
