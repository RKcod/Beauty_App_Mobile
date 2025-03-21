import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationItem extends StatelessWidget {
  final bool hasBeenRead;
  const NotificationItem({super.key, this.hasBeenRead = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CircleAvatar(
              radius: 4,
              backgroundColor:
                  hasBeenRead ? Color(0xffDFDEE4) : Palette.primaryColor,
            ),
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You have an appoitment at The Galleria Hair Salon at 8:00am today",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13),
                ),
                Gap(12),
                Text(
                  "Just now",
                  style: TextStyle(color: Color(0xffABAAB1), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
