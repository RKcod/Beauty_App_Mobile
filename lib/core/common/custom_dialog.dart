import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/palette.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final String firstButtonText;
  final void Function(BuildContext) firstButtonOnPressed;
  final String secondButtonText;
  final void Function(BuildContext) secondButtonOnPressed;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.firstButtonText,
      required this.firstButtonOnPressed,
      required this.secondButtonText,
      required this.secondButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 36),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "ParkinsansRegular"),
              ),
              const Gap(16),
              subtitle,
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        firstButtonOnPressed(context);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color:
                                    Color(0xff49454F).withValues(alpha: 0.4)),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      child: Text(
                        firstButtonText,
                        style: TextStyle(
                            fontFamily: "ParkinsansRegular",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff49454F).withValues(alpha: 0.4)),
                      )),
                  Gap(12),
                  TextButton(
                      onPressed: () {
                        secondButtonOnPressed(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      child: Text(
                        secondButtonText,
                        style: TextStyle(
                            fontFamily: "ParkinsansRegular",
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
