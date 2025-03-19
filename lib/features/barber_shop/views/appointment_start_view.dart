import 'package:beauty_app_mobile/core/common/custom_button.dart';
import 'package:beauty_app_mobile/core/utils/palette.dart';
import 'package:beauty_app_mobile/features/barber_shop/views/appointment_finish_view.dart';
import 'package:beauty_app_mobile/features/barber_shop/widgets/specialist_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentStartView extends StatelessWidget {
  const AppointmentStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              Text(
                "Select Date",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Gap(16),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        width: index == 1 ? 80 : 66,
                        height: 100,
                        decoration: BoxDecoration(
                          border:
                              index == 1
                                  ? Border.all(
                                    color: Palette.primaryColor,
                                    width: 2.5,
                                  )
                                  : null,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tu",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "18",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Gap(8),
                  itemCount: 7,
                ),
              ),
              Gap(36),
              Text(
                "Select Time",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Gap(16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                // alignment: WrapAlignment.spaceAr,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: 60,
                    height: 36,
                    decoration: BoxDecoration(
                      color: index == 0 ? Palette.primaryColor : null,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "10:00",
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(36),
              Text(
                "Specialists",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Gap(16),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) =>
                          SpecialistAppointmentWidget(isSelected: index == 0),
                  separatorBuilder: (context, index) => Gap(4),
                  itemCount: 7,
                ),
              ),
              SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: GestureDetector(
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
                          Gap(10),
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentFinishView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
