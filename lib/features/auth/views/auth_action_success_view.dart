import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/features/auth/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthActionSuccessView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtile;
  final String buttonText;
  const AuthActionSuccessView({
    super.key,
    required this.icon,
    required this.title,
    required this.subtile,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60),
            Gap(36),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(24),
            Text(
              subtile,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Gap(48),
            CustomButton(
              text: buttonText,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => SignInView()),
                  (route) => false,
                );
              },
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
