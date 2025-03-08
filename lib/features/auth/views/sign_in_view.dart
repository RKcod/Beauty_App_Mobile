import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_checkbox.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/auth/widgets/social_network_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool remember = false;

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
              "Welcome!",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text(
              "Sign in to continue",
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(40),
            CustomTextfield(
              hintText: "Email",
              leading: Icon(Iconsax.sms_outline),
            ),
            Gap(20),
            CustomTextfield(
              hintText: "Mot de passe",
              leading: Icon(Iconsax.lock_outline),
            ),
            Gap(24),
            CustomCheckbox(
              value: remember,
              onChanged: () {
                remember = !remember;
                setState(() {});
              },
              widget: Text(
                "Remember me",
                style: const TextStyle(
                  color: Palette.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Gap(24),
            CustomButton(text: "Sign in", isFullWidth: true),
            Gap(32),
            Center(
              child: Text(
                "Or Continue with",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
            Gap(28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                SocialNetworkContainer(
                  socialNetworkLogo: Brand(Brands.facebook, size: 20),
                ),
                SocialNetworkContainer(
                  socialNetworkLogo: Brand(Brands.google, size: 20),
                ),
                SocialNetworkContainer(
                  socialNetworkLogo: Icon(Icons.apple, size: 20),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Color(0xffABAAB1),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    color: Color(0xffABAAB1),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(8),
                Text(
                  "Sign up",
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
