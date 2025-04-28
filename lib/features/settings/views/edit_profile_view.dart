import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/common/custom_dropdown.dart';
import 'package:beauty_app_mobile/core/common/custom_textfield.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/profile_picture.png",
                            ),
                          ),
                        ),
                      ),
                      Gap(16),
                      Text(
                        "Change Avatar",
                        style: TextStyle(color: Palette.primaryColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Gap(36),
              CustomTextfield(
                title: "Full name",
                hintText: "Full name",
                initialText: "Emmanuel",
              ),
              Gap(20),
              CustomTextfield(
                title: "Email",
                hintText: "Email",
                initialText: "emmanuelmbang@gmail.com",
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      title: "Gender",
                      hint: "",
                      value: "Male",
                      options: ["Male", "Female"],
                      onChanged: (p0) => {},
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: CustomTextfield(
                      title: "Birth of date",
                      hintText: "",
                      initialText: "08/15/2012",
                      enabled: false,
                    ),
                  ),
                ],
              ),
              Gap(20),
              CustomTextfield(
                title: "Address",
                hintText: "Address",
                initialText: "6391 Elgin St. Celina, Delaware 10299",
              ),
              // Gap(20),
              // InternationalPhoneNumberInput(
              //   // key: widget.inputKey,
              //   // controller: controller,
              //   height: 56,
              //   phoneConfig: PhoneConfig(
              //     backgroundColor: Colors.transparent,
              //     radius: 0,
              //     borderWidth: 0,
              //     // hintText: "666 - 666 - 666",
              //     textStyle: const TextStyle(fontSize: 12.8),
              //     focusedColor: Colors.transparent,
              //     enabledColor: Colors.transparent,
              //     // autoFocus: true,
              //     decoration: null,
              //     showCursor: true,
              //     hintStyle: TextStyle(
              //       color: Colors.black.withValues(alpha: 0.5),
              //       fontSize: 12.8,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   // formatter: MaskedInputFormatter('### - ### - ###'),
              //   initCountry: CountryCodeModel(
              //     name: "Cameroon",
              //     dial_code: "+237",
              //     code: "CM",
              //   ),
              //   betweenPadding: 0,
              //   onInputChanged: (phone) {
              //     print(phone.code);
              //     print(phone.dial_code);
              //     print(phone.number);
              //     print(phone.rawFullNumber);
              //     print(phone.rawNumber);
              //     print(phone.rawDialCode);
              //   },
              //   countryConfig: CountryConfig(
              //     noFlag: true,
              //     flagSize: 0,
              //     decoration: const BoxDecoration(
              //       border: Border(),
              //       shape: BoxShape.circle,
              //     ),
              //     textStyle: const TextStyle(
              //       fontFamily: 'PoppinsLight',
              //       color: Colors.black,
              //       fontSize: 13,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),

              //   // validator: (number) {
              //   //   if (number.number.isEmpty) {
              //   //     print(number.number);
              //   //     return "Le numéro de téléphone doit être valide.";
              //   //   }
              //   //   return null;
              //   // },
              // ),
              Gap(40),
              CustomButton(
                text: "Save",
                isFullWidth: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
