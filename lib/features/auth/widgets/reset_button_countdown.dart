import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class ResetButtonCountdown extends StatelessWidget {
  final bool showCountDown;
  final void Function() onCountDownFinished;
  final bool resendLoading;
  final void Function() onResend;
  const ResetButtonCountdown({
    super.key,
    this.showCountDown = true,
    required this.onCountDownFinished,
    this.resendLoading = false,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        resendLoading
            ? CupertinoActivityIndicator(color: Colors.blueGrey)
            : GestureDetector(
              onTap: showCountDown ? null : onResend,
              child: Text(
                "Renvoyer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Palette.primaryColor.withValues(
                    alpha: showCountDown ? 0.54 : 1,
                  ),
                  fontWeight: FontWeight.w700,
                  fontFamily: "PoppinsBold",
                ),
              ),
            ),
        showCountDown
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "  (",
                  style: TextStyle(
                    color: Palette.primaryColor.withValues(alpha: 0.54),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: SlideCountdownSeparated(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    style: TextStyle(
                      color: Palette.primaryColor.withValues(alpha: 0.54),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    onDone: onCountDownFinished,
                    suffixIcon: Text(
                      " sec)",
                      style: TextStyle(
                        color: Palette.primaryColor.withValues(alpha: 0.54),
                        fontFamily: "ParkinsansRegular",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    duration: const Duration(seconds: 59),
                  ),
                ),
              ],
            )
            : const SizedBox(),
      ],
    );
  }
}
