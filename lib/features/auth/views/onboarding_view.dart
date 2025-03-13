import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/dot_indicator.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/auth/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;

  List<(String, String)> onboardingData = [
    (
      "Effortless Appointments Bookings",
      "Pick your dream salon, choose your preferred date, and secure your spot in a few taps.",
    ),
    (
      "Connect and Converse with Salons",
      "Real-time chats for effortless beauty consultation",
    ),
    (
      "Discover Nearby Beauty Havens",
      "Unlock the beauty secrets hidden in your neighborhood!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder:
                    (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding${index + 1}.png",
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                        Gap(16),
                        Text(
                          onboardingData[index].$1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: "PoppinsBold",
                          ),
                        ),
                        Gap(16),
                        Text(
                          onboardingData[index].$2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffABAAB1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
              ),
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: CustomButton(text: "Start", onPressed: () {}),
                ),
                DotIndicator(
                  length: 3,
                  selectedIndex: currentIndex,
                  dotSelectedColor: Palette.primaryColor,
                  dotUnselectedColor: Color(0xffF2F2F2),
                ),
                Opacity(
                  opacity: currentIndex == 2 ? 1 : 0,
                  child: CustomButton(
                    text: "Start",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => const SignUpView(),
                        ),
                      );
                    },
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
