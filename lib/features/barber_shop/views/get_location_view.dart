import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GetLocationView extends StatelessWidget {
  const GetLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/onboarding3.png",
              height: 280,
              fit: BoxFit.cover,
            ),
            Gap(24),
            Text(
              "What's your location ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(16),
            Text(
              "We need to know your location in order to suggest the best beauty havens around you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(36),
            CustomButton(
              text: "Allow location access",
              isFullWidth: true,
              onPressed: () async {
                await determinePosition();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => const HomeView()),
                );
              },
            ),
            Gap(12),
            CustomButton(
              isFullWidth: true,
              text: "Enter location manually",
              transparent: true,
              colorText: Palette.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
