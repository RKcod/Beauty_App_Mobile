import 'package:beauty_app_mobile/features/settings/widgets/settings_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),
            SettingsTitle(title: "Contact us"),
            Gap(48),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  children: [
                    Row(
                      children: [
                        Brand(Brands.mail),
                        Gap(8),
                        Text(
                          "Email :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(Brands.whatsapp),
                        Gap(8),
                        Text(
                          "WhatsApp :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(Brands.facebook),
                        Gap(8),
                        Text(
                          "Facebook :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(Brands.instagram),
                        Gap(8),
                        Text(
                          "Instagram :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(Brands.twitterx),
                        Gap(8),
                        Text(
                          "X :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
                    ),
                    Row(
                      children: [
                        Brand(Brands.linkedin),
                        Gap(8),
                        Text(
                          "LinkedIn :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        Text("test@gmail.com"),
                      ],
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
