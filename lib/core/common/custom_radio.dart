import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/palette.dart';

class CustomRadio extends StatelessWidget {
  final String text;
  final Object value;
  final Object? groupValue;
  final Widget? leading;
  final void Function(Object?) onChanged;

  const CustomRadio(
      {super.key,
      required this.value,
      this.groupValue,
      required this.onChanged,
      required this.text,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          if (leading != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: leading,
            ),
          Expanded(
              child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "ParkinsansRegular"),
          )),
          const Gap(8),
          Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return Palette.primaryColor;
                  }

                  return Colors.black26;
                },
              ))
        ],
      ),
    );
  }
}
