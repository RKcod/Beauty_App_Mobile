import 'package:beauty_app_mobile/models/specialist_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpecialistWidget extends StatelessWidget {
  final SpecialistModel specialist;
  const SpecialistWidget({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(specialist.imageUrl),
        ),
        Gap(8),
        Text(specialist.name, style: TextStyle(fontSize: 13)),
        Gap(2),
        Text(
          specialist.role,
          style: TextStyle(fontSize: 11, color: Color(0xffC6C5CD)),
        ),
      ],
    );
  }
}
