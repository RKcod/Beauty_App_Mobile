import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/settings/views/edit_profile_view.dart';
import 'package:beauty_app_mobile/features/settings/views/faq_view.dart';
import 'package:beauty_app_mobile/features/settings/views/notifications_view.dart';
import 'package:beauty_app_mobile/models/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingItem> items = [
      SettingItem(icon: Icons.credit_card, text: "Payment Methods"),
      SettingItem(icon: Icons.history, text: "Payment History"),
      SettingItem(icon: Icons.lock_outline, text: "Change Password"),
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
      SettingItem(icon: Icons.help_outline, text: "About Us"),
      SettingItem(icon: Icons.logout, text: "Logout"),
    ];

    return Scaffold(
      body: SingleChildScrollView(
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
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffDFDEE4)),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Icon(Icons.notifications_none_outlined),
                            Positioned(
                              top: 2,
                              right: 2,
                              child: CircleAvatar(
                                radius: 2,
                                backgroundColor: Palette.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xffDFDEE4)),
                    ),
                    child: Center(child: Icon(Icons.favorite_border)),
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
                    child: Icon(Icons.edit, size: 16, color: Color(0xff432BDF)),
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
                          Icon(items[index].icon),
                          Gap(12),
                          Text(items[index].text),
                          Spacer(),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: Color(0xffABAAB1),
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
