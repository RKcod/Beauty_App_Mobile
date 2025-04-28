import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/core/utils/utils.dart';
import 'package:beauty_app_mobile/features/settings/views/contact_us_view.dart';
import 'package:beauty_app_mobile/features/settings/views/edit_profile_view.dart';
import 'package:beauty_app_mobile/features/settings/views/faq_view.dart';
import 'package:beauty_app_mobile/features/settings/views/notifications_view.dart';
import 'package:beauty_app_mobile/features/settings/views/password_manager_view.dart';
import 'package:beauty_app_mobile/models/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  final ScrollController? controller;
  const ProfileView({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    List<SettingItem> items = [
      // SettingItem(icon: Icons.credit_card, text: "Payment Methods"),
      // SettingItem(icon: Icons.history, text: "Payment History"),
      SettingItem(
        icon: Icons.lock_outline,
        text: "Change Password",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PasswordManagerView()),
          );
        },
      ),
      SettingItem(icon: Icons.people_alt_outlined, text: "Invites Friends"),
      SettingItem(
        icon: Icons.forum_outlined,
        text: "FAQs",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaqView()),
          );
        },
      ),
      SettingItem(
        icon: Icons.help_outline,
        text: "Contact Us",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );
        },
      ),
      SettingItem(icon: Icons.receipt, text: "Terms and uses"),
      SettingItem(
        icon: Icons.logout,
        text: "Logout",
        onPressed: () {
          showCustomBottomSheet(
            context,
            title: "Logout",
            body:
                (ctx, state) => Material(
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Gap(24),
                        Text(
                          "Are you sure you want to logout ?",
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Gap(36),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: "Cancel",
                                colorText: Palette.primaryColor,
                                border: BorderSide(color: Palette.primaryColor),
                                transparent: true,
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                              ),
                            ),
                            Gap(16),
                            Expanded(
                              child: CustomButton(
                                text: "Yes, logout",
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                              ),
                            ),
                          ],
                        ),
                        Gap(16),
                      ],
                    ),
                  ),
                ),
          );
        },
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile_picture.png"),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsView(),
                        ),
                      );
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(Icons.notifications_none_outlined),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Palette.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12),
              Row(
                children: [
                  Text(
                    "Jerry Milona",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Gap(6),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileView(),
                          ),
                        ),
                    child: Icon(
                      Icons.edit,
                      size: 16,
                      color: Palette.primaryColor,
                    ),
                  ),
                ],
              ),
              Gap(2),
              Text(
                "zararehman@domain.io",
                style: TextStyle(fontSize: 13, color: Color(0xffABAAB1)),
              ),
              Gap(40),
              Column(
                spacing: 40,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  items.length,
                  (index) => GestureDetector(
                    onTap: items[index].onPressed,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(items[index].icon, color: Palette.primaryColor),
                          Gap(12),
                          Text(items[index].text),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: Palette.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
