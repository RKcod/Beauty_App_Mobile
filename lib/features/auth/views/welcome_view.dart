import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/auth/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Image.asset("assets/images/welcome_image.png"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Your ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "PoppinsBold",
                      ),
                      children: [
                        TextSpan(
                          text: "Ultimate Salon",
                          style: TextStyle(color: Palette.primaryColor),
                        ),
                        TextSpan(text: " Booking App"),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(28),
                  Text(
                    "Discover a world of beauty at your fingertips with Signature "
                    "Salon, the ultimate salon booking app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffABAAB1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(32),
                  CustomButton(
                    text: "Let's Get Started",
                    isFullWidth: true,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => const OnboardingView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 48),
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
          ),
        ],
      ),
    );
  }
}
