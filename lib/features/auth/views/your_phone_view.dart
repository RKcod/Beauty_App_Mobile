import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/packages/intl_phone_number_field/intl_phone_number_field.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/get_location_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class YourPhoneView extends StatelessWidget {
  const YourPhoneView({super.key});

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
              "Your phone!",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(5),
            Text(
              "A 4 digit security code will be sent via SMS to verify your mobile number!",
              style: TextStyle(
                color: Color(0xffABAAB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(40),
            InternationalPhoneNumberInput(
              // key: widget.inputKey,
              // controller: controller,
              height: 56,
              phoneConfig: PhoneConfig(
                backgroundColor: Colors.transparent,
                radius: 0,
                borderWidth: 0,
                // hintText: "666 - 666 - 666",
                textStyle: const TextStyle(fontSize: 12.8),
                focusedColor: Colors.transparent,
                enabledColor: Colors.transparent,
                // autoFocus: true,
                decoration: null,
                showCursor: true,
                hintStyle: TextStyle(
                  color: Colors.black.withValues(alpha: 0.5),
                  fontSize: 12.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // formatter: MaskedInputFormatter('### - ### - ###'),
              initCountry: CountryCodeModel(
                name: "Cameroon",
                dial_code: "+237",
                code: "CM",
              ),
              betweenPadding: 0,
              onInputChanged: (phone) {
                print(phone.code);
                print(phone.dial_code);
                print(phone.number);
                print(phone.rawFullNumber);
                print(phone.rawNumber);
                print(phone.rawDialCode);
              },
              countryConfig: CountryConfig(
                noFlag: true,
                flagSize: 0,
                decoration: const BoxDecoration(
                  border: Border(),
                  shape: BoxShape.circle,
                ),
                textStyle: const TextStyle(
                  fontFamily: 'PoppinsLight',
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // validator: (number) {
              //   if (number.number.isEmpty) {
              //     print(number.number);
              //     return "Le numéro de téléphone doit être valide.";
              //   }
              //   return null;
              // },
            ),
            Gap(40),
            CustomButton(
              text: "Continue",
              isFullWidth: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const GetLocationView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
