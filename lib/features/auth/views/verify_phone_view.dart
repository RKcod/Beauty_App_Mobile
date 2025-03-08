import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/auth/widgets/reset_button_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneView extends StatefulWidget {
  const VerifyPhoneView({super.key});

  @override
  State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
  bool showCountDown = true;
  bool isLoading = false;
  bool isSuccess = false;
  bool isPinputError = false;
  bool resendLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Text(
              "Verify phone",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text.rich(
              TextSpan(
                text:
                    "Please enter the 4 digit security code we just sent you at ",
                style: TextStyle(
                  color: Color(0xffABAAB1),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "713-444-xxxx",
                    style: TextStyle(color: Palette.primaryColor),
                  ),
                ],
              ),
            ),
            Gap(32),
            Pinput(
              autofocus: false,
              length: 4,
              showCursor: false,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              // separatorBuilder: (_) => const SizedBox(
              //   width: 24,
              // ),
              // keyboardType: TextInputType.none,
              defaultPinTheme: PinTheme(
                textStyle: TextStyle(
                  // color: isError ? Colors.red : null,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "ParkinsansExtraBold",
                ),
                decoration: BoxDecoration(
                  // border: Border.all(color: isError ? Colors.red : Colors.grey),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              focusedPinTheme: PinTheme(
                textStyle: TextStyle(
                  // color: isError ? Colors.red : null,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "ParkinsansExtraBold",
                ),
                decoration: BoxDecoration(
                  // border: Border.all(color: isError ? Colors.red : Colors.grey),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              submittedPinTheme: PinTheme(
                textStyle: TextStyle(
                  // color: isError ? Colors.red : null,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PoppinsBold",
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    // color: isError ? Colors.red : Palette.primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              pinputAutovalidateMode: PinputAutovalidateMode.disabled,
            ),
            Spacer(),
            ResetButtonCountdown(
              showCountDown: showCountDown,
              onCountDownFinished: () {
                showCountDown = false;
                setState(() {});
              },
              resendLoading: resendLoading,
              onResend: () async {
                resendLoading = true;
                setState(() {});

                await Future.delayed(const Duration(seconds: 3));

                resendLoading = false;
                showCountDown = true;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
