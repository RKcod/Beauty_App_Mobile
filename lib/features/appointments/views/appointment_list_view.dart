import 'package:beauty_app_mobile/core/enums/enums.dart';
import 'package:beauty_app_mobile/features/appointments/widgets/appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentListView extends StatefulWidget {
  const AppointmentListView({super.key});

  @override
  State<AppointmentListView> createState() => _AppointmentListViewState();
}

class _AppointmentListViewState extends State<AppointmentListView> {
  var appointmentType = AppointmentStatus.upcoming;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16),
            Text(
              "Your Appointments",
              style: TextStyle(fontSize: 20, fontFamily: "PoppinsBold"),
            ),
            Gap(36),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      appointmentType = AppointmentStatus.upcoming;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            appointmentType == AppointmentStatus.upcoming
                                ? Color(0xff191632)
                                : null,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            color:
                                appointmentType == AppointmentStatus.upcoming
                                    ? Colors.white
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      appointmentType = AppointmentStatus.passed;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            appointmentType == AppointmentStatus.passed
                                ? Color(0xff191632)
                                : null,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Pass",
                          style: TextStyle(
                            color:
                                appointmentType == AppointmentStatus.passed
                                    ? Colors.white
                                    : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(24),
            Expanded(
              child: ListView.separated(
                itemBuilder:
                    (context, index) =>
                        AppointmentWidget(status: appointmentType),
                separatorBuilder: (context, _) => Gap(16),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
