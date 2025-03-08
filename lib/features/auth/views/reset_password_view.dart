import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text(
              "Please enter a new password",
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(40),
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
            CustomButton(text: "Change password", isFullWidth: true),
          ],
        ),
      ),
    );
  }
}
