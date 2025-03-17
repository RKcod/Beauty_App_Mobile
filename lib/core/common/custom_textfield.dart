import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/palette.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialText;
  final String? title;
  final String hintText;
  final Widget? leading;
  final Widget? trailing;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
  final String? errorText;

  final Color backgroundColor;
  final Color borderColor;
  final bool hasBorder;
  final double? height;

  CustomTextfield({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.leading,
    this.trailing,
    this.inputFormatters,
    this.keyboardType,
    this.focusNode,
    this.title,
    this.onChanged,
    this.maxLines = 1,
    this.initialText,
    this.enabled = true,
    this.errorText,
    Color? backgroundColor,
    this.borderColor = Colors.black26,
    this.hasBorder = false,
    this.height,
  }) : backgroundColor = backgroundColor ?? const Color(0xffF2F2F2);

  @override
  Widget build(BuildContext context) {
    var colorError = Color(0xffFE685C).withValues(alpha: 0.54);

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
                fontFamily: "PoppinsBold",
              ),
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border:
                !hasBorder
                    ? null
                    : Border.all(
                      color:
                          enabled
                              ? errorText != null
                                  ? colorError
                                  : borderColor
                              : Colors.black12,
                    ),
          ),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: leading,
                ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  initialValue: initialText,
                  onChanged: onChanged,
                  obscureText: obscure,
                  obscuringCharacter: "*",
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType,
                  cursorColor: Palette.primaryColor,
                  focusNode: focusNode,
                  minLines: maxLines,
                  maxLines: maxLines,
                  enabled: enabled,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(color: Color(0xffABAAB1)),
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
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              errorText!,
              style: TextStyle(
                color: colorError,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontFamily: "ParkinsansLight",
              ),
            ),
          ),
      ],
    );
  }
}
