import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpecialistAppointmentWidget extends StatelessWidget {
  final bool isSelected;
  const SpecialistAppointmentWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 160,
      decoration: BoxDecoration(
        color: Color(0xFFF0EFEF).withValues(alpha: 0.3),
        border:
            isSelected
                ? Border.all(color: Palette.primaryColor, width: 2.5)
                : null,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage("assets/images/profile_picture.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer(),
          Text(
            "Connor",
            style: TextStyle(
              color: isSelected ? Palette.primaryColor : Colors.black,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : null,
            ),
          ),
          Gap(2),
          Text(
            "Sx Barber",
            style: TextStyle(fontSize: 11, color: Color(0xffABAAB1)),
          ),
        ],
      ),
    );
  }
}
