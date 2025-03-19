import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentSuccessView extends StatelessWidget {
  const AppointmentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Palette.primaryColor,
                  ),
                  Gap(36),
                  Text(
                    "Your appointment booking is successfully.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  Gap(24),
                  Text(
                    'You can view the appointment booking info in the “Appointment” section.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(isFullWidth: true, text: "Continue Booking"),
                  Gap(8),
                  CustomButton(
                    isFullWidth: true,
                    transparent: true,
                    text: "Go to appointment",
                    colorText: Color(0xff432BDF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
