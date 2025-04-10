import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/appointments/views/appointment_success_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/home_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/salon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentFinishView extends StatelessWidget {
  const AppointmentFinishView({super.key});

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
              "Book Appointment",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "PoppinsBold",
              ),
            ),
            Gap(40),
            SalonWidget(salon: salons[2]),
            Gap(30),
            Text(
              "Services",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Gap(12),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: List.generate(
                2,
                (index) => Row(
                  children: [
                    Container(
                      width: 24,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Gap(16),
                    Text("Regular haircut", style: TextStyle(fontSize: 15)),
                    Spacer(),
                    Text(
                      "\$5.00",
                      style: TextStyle(
                        fontSize: 15,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date & Time",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "12 September, 12:00",
                  style: TextStyle(fontSize: 15, color: Palette.primaryColor),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Color(0xffABAAB1),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(36),
                        Text(
                          "\$8.12",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentSuccessView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
