import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  final String title;
  const SettingsTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "PoppinsBold",
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(8),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
