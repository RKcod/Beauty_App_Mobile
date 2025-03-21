import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/settings/widgets/notification_item.dart';
import 'package:beauty_app_mobile/features/settings/widgets/settings_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool enableNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SettingsTitle(title: "Notifications"),
              ),
              Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      "Mark all as read",
                      style: TextStyle(fontSize: 13, color: Color(0xffABAAB1)),
                    ),
                    Spacer(),
                    Text(
                      "Do not disturb",
                      style: TextStyle(fontSize: 13, color: Color(0xffABAAB1)),
                    ),
                    Gap(4),
                    SizedBox(
                      width: 44,
                      height: 24,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CupertinoSwitch(
                          value: enableNotification,
                          activeTrackColor: Palette.primaryColor,
                          onChanged: (_) {
                            enableNotification = !enableNotification;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(12),
              Divider(color: Color(0xffEFEFEF)),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) =>
                        NotificationItem(hasBeenRead: index > 0),
                separatorBuilder:
                    (context, _) => Divider(color: Color(0xffEFEFEF)),
                itemCount: 5,
              ),
              Divider(color: Color(0xffEFEFEF)),
            ],
          ),
        ),
      ),
    );
  }
}
