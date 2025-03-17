import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpecialistWidget extends StatelessWidget {
  const SpecialistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage("assets/images/profile_picture.png"),
        ),
        Gap(8),
        Text("Lily", style: TextStyle(fontSize: 13)),
        Gap(2),
        Text(
          "Hair Stylist",
          style: TextStyle(fontSize: 11, color: Color(0xffC6C5CD)),
        ),
      ],
    );
  }
}
