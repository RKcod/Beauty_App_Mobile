import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';

class QuickActionsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const QuickActionsItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Palette.primaryColor.withValues(alpha: 0.4),
            child: Icon(icon, color: Palette.primaryColor),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
