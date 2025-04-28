import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/auth/views/forgot_password_choose_view.dart';
import 'package:beauty_app_mobile/features/settings/widgets/settings_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class PasswordManagerView extends StatelessWidget {
  const PasswordManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Gap(16),
            SettingsTitle(title: "Password Manager"),
            Gap(48),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextfield(
                      hintText: "Enter a actual password",
                      leading: Icon(Iconsax.lock_outline),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (builder) => const ForgotPasswordChooseView(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Gap(48),
                    CustomTextfield(
                      hintText: "Enter a new password",
                      leading: Icon(Iconsax.lock_outline),
                    ),
                    Gap(20),
                    CustomTextfield(
                      hintText: "Confirm your new password",
                      leading: Icon(Iconsax.lock_outline),
                    ),
                    Gap(20),
                    CustomButton(
                      text: "Change password",
                      isFullWidth: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
