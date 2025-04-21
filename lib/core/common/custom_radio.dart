import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/palette.dart';

class CustomRadio<T> extends StatelessWidget {
  final String text;
  final T value;
  final T? groupValue;
  final Widget? leading;
  final bool isDisabled;
  final void Function(T?) onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
    required this.text,
    this.leading,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          isDisabled
              ? null
              : () {
                onChanged(value);
              },
      child: Row(
        children: [
          if (leading != null)
            Padding(padding: const EdgeInsets.only(right: 16), child: leading),
          Expanded(
            child: GestureDetector(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isDisabled ? Colors.black12 : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Gap(4),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: isDisabled ? null : onChanged,
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return Palette.primaryColor;
              } else if (states.contains(WidgetState.disabled)) {
                return Colors.black12;
              }

              return Colors.black87;
            }),
          ),
        ],
      ),
    );
  }
}
