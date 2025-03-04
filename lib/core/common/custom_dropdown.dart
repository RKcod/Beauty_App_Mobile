import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final Color background;
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final List<String> options;

  final String? hint;
  final double hintSize;
  final Widget? hintWidget;
  final void Function()? onTap;
  final String? value;

  CustomDropdown(
      {super.key,
      required this.options,
      Color? background,
      this.title,
      this.leading,
      this.trailing,
      this.hint,
      this.hintWidget,
      this.hintSize = 15,
      this.onTap,
      this.value})
      : background = background ?? Colors.white.withValues(alpha: 0.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "ParkinsansBold"),
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(color: Colors.black12)),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: leading,
                ),
              Expanded(
                child: hintWidget ??
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        value ?? (hint ?? ""),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: "ParkinsansLight",
                            fontSize: hintSize,
                            color: Colors.black
                                .withValues(alpha: value != null ? 1 : 0.54)),
                      ),
                    ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: trailing,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
