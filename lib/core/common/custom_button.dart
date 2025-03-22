import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/palette.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool isFullWidth;
  final Color color;
  final Color colorText;
  final bool isDisabled;
  final bool transparent;
  final bool loading;
  final BorderSide? border;
  final double radius;
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.child,
    this.isFullWidth = false,
    this.color = Palette.primaryColor,
    this.isDisabled = false,
    this.transparent = false,
    this.loading = false,
    this.colorText = Colors.white,
    this.border,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: isFullWidth ? double.infinity : null,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              transparent
                  ? null
                  : color.withValues(alpha: isDisabled ? 0.5 : 1),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            side: border ?? BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child:
            loading
                ? CupertinoActivityIndicator(color: colorText, radius: 12)
                : (text != null
                    ? Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorText,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: "PoppinsBold",
                      ),
                    )
                    : child!),
      ),
    );
  }
}
