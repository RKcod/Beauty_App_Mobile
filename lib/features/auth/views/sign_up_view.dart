import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
              "Sign up",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text(
              "Create a new account",
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(40),
            CustomTextfield(
              hintText: "Nom",
              leading: Icon(EvaIcons.person_outline),
            ),
            Gap(20),
            CustomTextfield(
              hintText: "Email",
              leading: Icon(Iconsax.sms_outline),
            ),
            Gap(20),
            CustomTextfield(
              hintText: "Mot de passe",
              leading: Icon(Iconsax.lock_outline),
            ),
            Gap(20),
            CustomButton(text: "Sign up", isFullWidth: true),
            Gap(24),
            Text.rich(
              TextSpan(
                text: "By contunuing Sign up you agree to the following ",
                children: [
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  TextSpan(text: " without reservation"),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xffABAAB1),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xffABAAB1),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(8),
                Text(
                  "Sign in",
                  style: TextStyle(
                    color: Palette.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PoppinsBold",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
